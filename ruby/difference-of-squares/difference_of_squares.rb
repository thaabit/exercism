class Squares
  def initialize(count)
    @count = count
  end
  def square_of_sum
    (1..@count).sum ** 2
  end
  def sum_of_squares
    (1..@count).sum { |n| n ** 2 }
  end
  def difference
    self.square_of_sum - self.sum_of_squares
  end
end
