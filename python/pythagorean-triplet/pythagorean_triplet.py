def triplets_with_sum(number):
    out = []
    for a in range(1,number + 1):
        for b in range(a,number + 1):
            c = number - a - b
            if c < 1: break
            elif a > b: continue
            elif b > c: continue
            if a**2 + b**2 == c**2:
                out.append([a,b,c])
    return out
