class Prime
  def self.nth(n)
    raise ArgumentError if n < 1
    return 2 if n == 1
    i = 1
    (n - 1).times do
      loop do
        i += 2
        break if i == 3
        is_prime = true
        (3..(Math.sqrt(i).to_i + 1)).step(2).each { |j|
          if i % j == 0
            is_prime = false
            break
          end
        }
        break if is_prime
      end
    end
    return i
  end
end
