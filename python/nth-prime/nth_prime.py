counter, primes = 3, [2]
def prime(number):
    global counter, primes
    if number == 0: raise ValueError('there is no zeroth prime')
    is_prime = True
    while 1:
        if len(primes) >= number: return primes[number - 1]

        is_prime = True
        for p in primes:
            if counter % p == 0:
                is_prime = False
                break
        if is_prime:
            primes.append(counter)
        counter += 2
