def is_positive_integer(n):
    is_int = False
    if isinstance(n, int):
        is_int = True
    if isinstance(n, float):
        is_int = n.is_integer()
    return is_int and n > 0

def steps(number, step=0):
    if not is_positive_integer(number):
        raise ValueError("Only positive integers are allowed")

    if number == 1: return step
    step += 1
    if number % 2 == 0:
        number = number / 2
        return steps(number, step)
    else:
        number = 3 * number + 1
        return steps(number, step)


