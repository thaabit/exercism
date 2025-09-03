class Poker
  CARD_VALUE = { :J => 11, :Q => 12, :K => 13, :A => 14 }

  def initialize(hands)
    @hands = hands
  end

  def hand_value(hand)

    ranks = hand.map { |card| (CARD_VALUE[card[0].to_sym] || card[0..-1]).to_i }.sort
    ranks = [1,2,3,4,5] if ranks == [2,3,4,5,14]
    counts = ranks.each_with_object(Hash.new(0)) { |num, agg| agg[num] += 1 }
    groups = counts.values

    flush = hand.map { |card| card[-1] }.uniq.size == 1
    straight = (ranks.max - ranks.min == 4) && (ranks.uniq.size == 5)

    comps = []
    comps << (straight && flush ? ranks.max : 0)
    comps << (counts.key(4) || 0)
    comps << (groups.include?(3) && groups.include?(2) ? [counts.key(3), counts.key(2)] : [0, 0])
    comps << (flush ? ranks.max : 0)
    comps << (straight ? ranks.max : 0)
    comps << (counts.key(3) || 0)
    comps << (groups.count(2) == 2 ? counts.select { |rank, count| count == 2 }.keys.sort.reverse : [0, 0])
    comps << (counts.key(2) || 0)
    comps += ranks.reverse
    comps
  end

  def best_hand
    hand_values = @hands.map { |hand| hand_value(hand) }
    max = hand_values.max
    @hands.select.with_index { |hand, i| hand_values[i] == max }
  end

end
