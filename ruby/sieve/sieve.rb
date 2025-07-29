class Sieve
  def initialize(number)
    @number = number
  end
  def primes
    if @number < 2 then return [] end
    marked = {}
    primes = []
    (2..@number).each do |n|
      if marked[n] then next end
      primes << n
      (n..@number).step(n) do |m|
        marked[m] = true
      end
    end
    return primes
  end
end
