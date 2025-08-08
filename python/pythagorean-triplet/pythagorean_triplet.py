squared = {}
def triplets_with_sum(number):
    out = []
    for a in range(1,number + 1):
        if a not in squared: squared[a] = a**2
        a_squared = squared[a]
        for b in range(a,number + 1):
            if b not in squared: squared[b] = b**2

            c = number - a - b
            if c < 1: break
            elif a > b: continue
            elif b > c: continue

            if c not in squared: squared[c] = c**2
            if a_squared + squared[b] == squared[c]:
                out.append([a,b,c])
    return out
