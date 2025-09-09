discounts = [1, .95, .90, .8, .75]
def total(basket):
    groups = []
    while len(basket) > 0:
        u = set(basket)
        groups.append(len(u))
        for b in u:
            basket.remove(b)

    while 3 in groups and 5 in groups:
        groups.remove(3)
        groups.remove(5)
        groups.append(4)
        groups.append(4)

    total = 0
    for size in groups:
        total += size * 800 * discounts[size - 1]
    return total
