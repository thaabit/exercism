class PythagoreanTriplet
  def self.triplets_with_sum(num)
    half = num/2
    out = []
    (2...half).each { |a|
      (a+1...half).each { |b|
        c = num - a - b
        lhs = a**2 + b**2
        rhs = c**2
        break if lhs > rhs
        out.append([a,b,c]) if lhs == rhs
      }
    }
    return out
  end
end
