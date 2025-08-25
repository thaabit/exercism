class Palindromes
  attr_reader :largest, :smallest

  def initialize(max_factor:, min_factor:1)
    @max_factor = max_factor
    @min_factor = min_factor
    @largest = { value: nil, factors: [] }
    @smallest = { value: nil, factors: [] }
  end

  def generate
    products = {}
    for x in min_factor..max_factor + 1
      for y in min_factor..max_factor + 1
        value = x * y
        digits = value.digits
        if digits == digits.reverse
          if !@largest.value or value > @largest.value
            @largest.value = value
            @largest.factors = []
          end
          @largest.factors << [x,y] if value == @largest.value
          if !@smallest.value or value < @smallest.value
            @smallest.value = value
            @smallest.factors = []
          end
          @smallest.factors << [x,y] if value == @smallest.value
        end
      end
    end
  end
end
Palindromes.new(max_factor: 999, min_factor: 100).generate
