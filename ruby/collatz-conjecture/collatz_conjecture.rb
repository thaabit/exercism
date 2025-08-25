class CollatzConjecture
  def self.steps(num, steps=0)
    raise ArgumentError if num < 1
    return steps if num == 1
    return steps(num.even? ? num / 2 : num * 3 + 1, steps + 1)
  end
end
