import itertools
def maximum_value(maximum_weight, items):
    value = 0
    for i in range(1, len(items) + 1):
        combos = itertools.combinations(items, i)
        for c in combos:
            weight = sum(x['weight'] for x in c)
            if weight <= maximum_weight:
                v = sum(x['value'] for x in c)
                if v > value: value = v
    return value
