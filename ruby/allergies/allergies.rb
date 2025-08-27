class Allergies
  @allergies = %w[eggs peanuts shellfish strawberries tomatoes chocolate pollen cats]
  def initialize(score)
    @score = score
    @allergies.each_with_index { |a, i|
      puts [a,i].inspect
    }
  end
end
Allergies.new(7)
