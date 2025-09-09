Item = Struct.new(:weight, :value, keyword_init: true)

class Knapsack
  def initialize(max_weight)
    @max_weight = max_weight
  end

  def max_value(items)
    max_value = nil
    next_item = ->(weight, value, items) {
      items.each_with_index { |item, i|
        items.delete_at(i)
        next_item.call(item.weight + weight, value + item.value, items.dup) if item.weight + weight <= @max_weight
        next_item.call(weight, value, items.dup)
      }
      max_value = value if max_value.nil? or value > max_value
    }
    next_item.call(0, 0, items)
    max_value
  end
end
