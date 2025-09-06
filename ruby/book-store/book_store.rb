class BookStore
  DISCOUNTS = [0, 0, 0.05, 0.1, 0.2, 0.25]
  BASE_PRICE = 8

  def self.find_group(basket)
    count = basket.keys.size
    basket.keys.each { |i|
      basket[i] -= 1
      basket.delete(i) if basket[i] == 0
    }
    return count
  end

  def self.calculate_price(basket)
    basket = basket.each_with_object(Hash.new(0)) { |v, hash| hash[v] += 1 }
    groups = Hash.new(0)
    groups[find_group(basket)] += 1 until basket.empty?

    [groups[5], groups[3]].min.times {
      groups[5] -= 1
      groups[3] -= 1
      groups[4] += 2
    }
    groups.reduce(0) { |agg, (k, v)| agg + k * v * BASE_PRICE * (1 - DISCOUNTS[k]) }
  end
end
