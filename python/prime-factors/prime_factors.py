def prime_numbers(n):
    primes = []
    for i in range(2, n + 1):
        for j in range(2, int(i ** 0.5) + 1):
            if i%j == 0:
                break
        else:
            primes.append(i)
    return primes

primes = prime_numbers(1_000_000)
def factors(value):
    out = []
    for prime in primes:
        while value % prime == 0:
            value = value / prime
            out.append(prime)
    return out
