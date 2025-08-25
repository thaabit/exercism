class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 1
    sum = (2..number - 1).each_with_object([1]) { |n,out|
      out << n if number % n == 0
    }.sum
    return "deficient" if sum <  number
    return "perfect"   if sum == number
    return "abundant"  if sum >  number
  end
end
