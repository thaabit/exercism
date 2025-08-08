from itertools import permutations
def can_chain(dominoes):
    if not len(dominoes): return []
    groups = list(permutations(dominoes, len(dominoes)))
    for group in groups:
        if group[0][0] == group[-1][1]:
            valid = True
            prev = group[0]
            for idx, d in enumerate(group[1::]):
                if d[0] != prev[1]:

                    # flip the domino if not last one
                    if idx < (len(group) - 1) and d[1] == prev[1]:
                        d = (d[1], d[0])
                        lst = list(group)
                        lst[idx + 1] = d
                        groups.append(tuple(lst))
                        valid = False
                        break
                    else:
                        valid = False
                        break
                prev = d
            if valid: return group
    return
