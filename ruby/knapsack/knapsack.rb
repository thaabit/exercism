Item = Struct.new(:weight, :value, keyword_init: true)

class Knapsack
  def initialize(max_weight)
    @max_weight = max_weight
  end

  def max_value(items)
    (1..items.size).flat_map { |size|
      items.combination(size).map { |combo|
        combo.sum(&:weight) <= @max_weight ? combo.sum(&:value) : 0
      }
    }.max || 0
  end
end
