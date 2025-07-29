def is_positive_integer(n):
    is_int = False
    if isinstance(n, int):
        is_int = True
    if isinstance(n, float):
        is_int = n.is_integer()
    return is_int and n > 0

def classify(number):
    """ A perfect number equals the sum of its positive divisors.

    :param number: int a positive integer
    :return: str the classification of the input integer
    """
    if not is_positive_integer(number):
        raise ValueError("Classification is only possible for positive integers.")

    divisors = []
    r = range(1, number)
    for i in r:
        if number % i == 0:
            divisors.append(i)

    aliquot = sum(divisors)
    if aliquot > number:
        return 'abundant'
    elif aliquot == number:
        return 'perfect'
    else:
        return 'deficient'

