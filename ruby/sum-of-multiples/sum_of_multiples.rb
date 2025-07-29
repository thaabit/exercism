class SumOfMultiples
  def initialize(*items)
    @items = items
  end

  def to(level)
    @items.map { |item| item > 0 ? (item...level).step(item).to_a : 0 }.flatten.uniq.sum
  end
end
