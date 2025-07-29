def primes(limit):
    prime_list = []
    nums = {i:True for i in range(2, limit + 1)}
    for n in sorted(nums.keys()):
        if nums[n] == False: continue
        else:
            prime_list.append(n)
            m = n + n
            while m <= limit:
                nums[m] = False
                m = m + n
    return prime_list
