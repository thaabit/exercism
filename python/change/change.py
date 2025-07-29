def find_fewest_coins(coins, target):
    coins = sorted(coins)[::-1]
    map_ = {}
    possibles = []
    for c in sorted(coins)[::-1]:
        if c <= target:
            for i in range(int(target / c))[::-1]:
                p = (i + 1) * c
                if p not in map_:
                    map_[p] = c
                    possibles.append(p)
    #print(possibles)
    if not len(possibles): raise ValueError("can't make target with given coins")
    chunks = find_in_list(possibles, target)
    #print(chunks)
    if not len(chunks): raise ValueError("can't make target with given coins")

    out = []
    for c in chunks:
        print(c, map_)
        coin = map_[c]
        for i in range(int(c / coin)): out.append(coin)
    return out[::-1]

def find_in_list(possibles, target, out=[]):
    print(possibles, target, out)
    for i, num in enumerate(possibles):
        if num == target:
            out.append(num)
            return out
        elif num < target:
            new_out = out[::]
            new_out.append(num)
            if find_in_list(possibles[i + 1:], target - num, new_out): return new_out


print(find_fewest_coins([1, 2, 5, 10, 20, 50, 100], 999))
#print(find_fewest_coins([1, 10, 11], 20))
#print(find_fewest_coins([11, 10, 1], 20))
#print(find_fewest_coins([100, 25, 10, 5, 1], 25))
