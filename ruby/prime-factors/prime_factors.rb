require 'prime'

class PrimeFactors
  def self.of(num, primes=[])
    return primes if num <= 1
    (2..num).each { |i|
      if Prime.prime?(i) and num % i == 0
        while num % i == 0
          primes << i
          num = num / i
        end
        #puts [i, num].inspect
        return of(num, primes)
      end
    }
  end
end
