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

    largest_ = 0
    range_ = range(min_factor, max_factor + 1)
    for i in range_:
        p = i * i
        if p > largest_ and is_palindrome(p):
            largest_ = p

    for pair in list(itertools.combinations(range_, 2)):
        p = pair[0] * pair[1]
        if p > largest_ and is_palindrome(p):
            largest_ = p
    if largest_ == 0: return (None, [])
    factors = get_factors(largest_, min_factor, max_factor)
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
    smallest_ = max_factor * max_factor
    range_ = range(min_factor, max_factor + 1)
    for i in range_:
        p = i * i
        if p < smallest_ and is_palindrome(p):
            smallest_ = p

    for pair in list(itertools.combinations(range_, 2)):
        p = pair[0] * pair[1]
        if p < smallest_ and is_palindrome(p):
            smallest_ = p
    if not is_palindrome(smallest_): return (None, [])
    factors = get_factors(smallest_, min_factor, max_factor)
    return (smallest_, factors)

def is_palindrome(number):
    num = str(number)
    start = 0
    end = len(num) - 1
    while start <= end:
        if num[start] != num[end]: return False
        start += 1
        end -= 1
    return True

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
