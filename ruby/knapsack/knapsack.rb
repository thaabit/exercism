Item = Struct.new(:weight, :value, keyword_init: true)

class Knapsack
  def initialize(max_weight)
    @max_weight = max_weight
  end

  def max_value(items)
    (1..items.size).flat_map { |size|
      items.combination(size).filter_map { |combo|
        combo.sum(&:value) if combo.sum(&:weight) <= @max_weight
      }
    }.max || 0
  end
end
