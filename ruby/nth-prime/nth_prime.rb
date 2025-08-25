class Prime
  def self.nth(n)
    raise ArgumentError if n < 1
    return 2 if n == 1
    i = 1
    (n - 1).times do
      loop do
        i += 2
        break if is_prime?(i)
      end
    end
    return i
  end

  def self.is_prime?(n)
    return true if n == 2
    return true if n == 3
    (3..(Math.sqrt(n).to_i + 1)).step(2).each { |factor|
      return false if n % factor == 0
    }
    return true
  end
end
