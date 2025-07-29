import itertools
def largest(min_factor, max_factor):
    """Given a range of numbers, find the largest palindromes which
       are products of two numbers within that range.

    :param min_factor: int with a default value of 0
    :param max_factor: int
    :return: tuple of (palindrome, iterable).
             Iterable should contain both factors of the palindrome in an arbitrary order.
    """
    if min_factor > max_factor: raise ValueError('min must be <= max')

    largest_, factors = None, []
    for i in range(max_factor ** 2, min_factor ** 2 - 1, -1):
        if is_palindrome(i):
            factors = get_factors(i, min_factor, max_factor)
            if factors:
                largest_ = i
                break

    return (largest_, factors)


def smallest(min_factor, max_factor):
    """Given a range of numbers, find the smallest palindromes which
    are products of two numbers within that range.

    :param min_factor: int with a default value of 0
    :param max_factor: int
    :return: tuple of (palindrome, iterable).
    Iterable should contain both factors of the palindrome in an arbitrary order.
    """

    if min_factor > max_factor: raise ValueError('min must be <= max')

    smallest_, factors = None, []
    for i in range(min_factor ** 2, max_factor ** 2 + 1):
        if is_palindrome(i):
            factors = get_factors(i, min_factor, max_factor)
            if factors:
                smallest_ = i
                break

    return (smallest_, factors)

def is_palindrome(number):
    num = str(number)
    return num[::-1] == num

def get_factors(number, min_factor, max_factor):
    factors = []
    seen = set()
    for i in range(min_factor, max_factor + 1):
        if i in seen: break
        if number % i == 0:
            b = int(number / i)
            if b > max_factor: continue
            if b < min_factor: break
            factors.append([i, b])
            seen.add(b)
    return factors
