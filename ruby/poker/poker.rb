class Poker
  CARD_VALUE = { :J => 11, :Q => 12, :K => 13, :A => 14 }

  def initialize(hands)
    @hands = hands
  end

  def hand_value(hand)

    ranks = hand.map { |card| (CARD_VALUE[card[0].to_sym] || card[0..-1]).to_i }.sort
    ranks = [1,2,3,4,5] if ranks == [2,3,4,5,14]
    sets = ranks.each_with_object(Hash.new(0)) { |num, agg| agg[num] += 1 }

    flush = hand.map { |card| card[-1] }.uniq.size == 1
    straight = (ranks.max - ranks.min == 4) && (ranks.uniq.size == 5)
    twos = sets.select { |_, count| count == 2 }.keys.sort.reverse
    three, four = sets.key(3), sets.key(4)
    high = ranks.max

    {
      :royal    => (straight && flush  ? high    : 0),
      :four     => (four               ? four    : 0),
      :full     => (three && twos.any? ? [three, twos[0]] : [0, 0]),
      :flush    => (flush              ? high    : 0),
      :straight => (straight           ? high    : 0),
      :three    => (three              ? three   : 0),
      :pairs    => (twos.size == 2     ? twos    : [0, 0]),
      :pair     => (twos.any?          ? twos[0] : 0),
      :high     => ranks.reverse
    }.values
  end

  def best_hand
    hand_values = @hands.map { |hand| hand_value(hand) }
    max = hand_values.max
    @hands.select.with_index { |hand, i| hand_values[i] == max }
  end

end
