shortest = []
def find_fewest_coins(coins, target):
    global shortest
    shortest = []
    coins = sorted(coins)[::-1]
    if target == 0: return []
    if target < 0: raise ValueError("target can't be negative")
    for i, p in enumerate(coins):
        find_next_coin(0, coins, target, i, [])
    if not len(shortest): raise ValueError("can't make target with given coins")

    return sorted(shortest)

def find_next_coin(balance, coins, target, index, change=[]):
    global shortest

    change = list(change) # make a copy

    if len(change) >= len(shortest) > 0: return
    if index >= len(coins): return

    if balance == target:
        shortest = change
        return

    coin = coins[index]
    if balance + coin > target:
        find_next_coin(balance, coins, target, index + 1, change)
        return

    balance = balance + coin
    change.append(coin)
    find_next_coin(balance, coins, target, index, change)
    find_next_coin(balance, coins, target, index + 1, change)
