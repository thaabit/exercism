class Change
  def self.generate(coins, sum)
    raise NegativeTargetError if sum < 0
    return [] if sum == 0

    best = nil
    next_coin = -> (left, change) {
      coins.each { |coin|
        if coin == left
          change << coin
          best = change if best.nil? or change.length < best.length
        end
        next_coin.call(left - coin, change.dup << coin) if coin < left
      }
    }
    next_coin.call(sum, [])
    return best || raise ImpossibleCombinationError
  end
end
p Change.generate([1, 5, 10, 25, 100], 15)
