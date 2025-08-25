class PythagoreanTriplet
  def self.triplets_with_sum(num)
    (1...(num/3)).each_with_object([]) { |a, out|
      b = (num * (num - 2 * a)) / (2 * (num - a))
      c = num - a - b
      next if a > b || b > c
      out << [a,b,c] if a**2 + b**2 == c**2
    }
  end
end
