class Yacht
  ORDER = %w[zeroes ones twos threes fours fives sixes]
  attr_accessor :dice, :sets
  def initialize(dice, category)
    @dice = dice
    @category = category
    @sets = @dice.each_with_object(Hash.new(0)) { |die, hash| hash[die] += 1 }
  end

  def has(i)
    sets.values.include?(i)
  end

  def score
    case @category
    when "yacht"
      has(5) ? 50 : 0
    when "full house"
      has(3) && has(2) ? dice.sum : 0
    when "four of a kind"
      (sets.key(4) || sets.key(5) || 0) * 4
    when "little straight"
      dice.sort == [1,2,3,4,5] ? 30 : 0
    when "big straight"
      dice.sort == [2,3,4,5,6] ? 30 : 0
    when "choice"
      dice.sum
    else
      num = ORDER.index(@category)
      sets[num] * num
    end
  end
end
