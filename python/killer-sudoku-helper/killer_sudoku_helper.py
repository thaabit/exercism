import itertools
def combinations(target, size, exclude):

    nums = [i for i in list(range(1,10)) if i not in exclude]
    combos = list(itertools.combinations(nums, size))
    valid = []
    for combo in combos:
        if sum(combo) == target:
            valid.append(list(combo))

    return valid

print(combinations(7, 3, []))
