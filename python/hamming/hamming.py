def distance(strand_a, strand_b):
    if len(strand_a) != len(strand_b):
        raise ValueError("Strands must be of equal length.")
    a,b = list(strand_a), list(strand_b)
    hamming = 0
    for i, vala in enumerate(a):
        valb = b[i]
        if vala != valb:
            hamming += 1
    return hamming
