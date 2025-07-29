from math import sqrt
def triplets_with_sum(number):
    number = float(number)
    triplets = []
    for c in range(int(number / 2) - 1, int((sqrt(2) - 1) * number), -1):
        whatever = sqrt(c ** 2 - number ** 2 + 2 * number * c)
        if whatever == int(whatever):
            triplets.append([int((number - c - whatever) / 2), int((number - c + whatever) / 2), c])
    return triplets
