ALLERGIES = %w[eggs peanuts shellfish strawberries tomatoes chocolate pollen cats].freeze
class Allergies
  attr_reader :list
  def initialize(score)
    @score = score
    @list = score.to_s(2).to_i.digits.each_with_object([]).with_index { |(flag,all), idx|
      all << ALLERGIES[idx] if flag == 1 and ALLERGIES.length > idx
    }
  end
  def allergic_to?(allergen)
    @list.include?(allergen)
  end
end
