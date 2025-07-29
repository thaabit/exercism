def sum_of_multiples(limit, multiples):
    values = {}
    multiples = set(multiples)
    for num in multiples:
        if num < 1: continue
        counter = num
        while counter < limit:
            values[counter] = 1
            counter += num
    total = sum(values)
    return total
