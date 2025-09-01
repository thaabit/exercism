class PrimeFactors
  def self.of(num, primes=[])
    return primes if num <= 1
    (2..num).each { |i|
      if num % i == 0
        while num % i == 0
          primes << i
          num = num / i
        end
        return of(num, primes)
      end
    }
  end
end
