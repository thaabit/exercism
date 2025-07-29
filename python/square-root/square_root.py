def square_root(number):
    initial = int(number/10) + 1
    for i in range(10):
        initial = .5 * (initial + (number / initial))
    return round(initial, 2)
