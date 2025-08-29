class Change
  class ImpossibleCombinationError < StandardError; end
  class NegativeTargetError < StandardError; end

  def self.generate(coins, sum)
    raise NegativeTargetError if sum < 0
    return [] if sum == 0

    coins = coins.sort.reverse
    best = nil
    next_coin = -> (left, change, available) {
      available.each { |coin|
        return if best and change.length > best.length
        return if available.empty?
        if coin == left
          change << coin
          best = change.sort if best.nil? or change.length < best.length
          return
        end
        next_coin.call(left - coin, change.dup << coin, available) if coin < left
        available = available[1..]
      }
    }
    next_coin.call(sum, [], coins)
    best or raise ImpossibleCombinationError
  end
end
