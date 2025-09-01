class PrimeFactors
  def self.of(num, primes=[])
    (2..num).each_with_object([]) { |i, out|
      return out if num <= 1
      if num % i == 0
        while num % i == 0
          out << i
          num = num / i
        end
        return out + of(num, primes)
      end
    }
  end
end
