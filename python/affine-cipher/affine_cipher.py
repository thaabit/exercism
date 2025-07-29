import math
import string
lowers = string.ascii_lowercase
m = 26

# E(x) = (ai + b) mod m
def encode(plain_text, a, b):
    if not are_coprime(a, m): raise ValueError("a and m must be coprime.")
    out = ''
    for c in plain_text:
        c = c.lower()
        if c.isnumeric():
            out += c
        elif c in lowers:
            out += lowers[(a * lowers.index(c) + b) % m]

    return " ".join([out[i:i+5] for i in range(0, len(out), 5)])


# D(y) = (a^-1)(y - b) mod m
def decode(ciphered_text, a, b):
    if not are_coprime(a, m): raise ValueError("a and m must be coprime.")
    out = ''
    mmi = 0
    for i in range(1,100):
        if (a * i) % m == 1:
            mmi = i
            break
    for c in ciphered_text:
        if c == ' ': continue
        elif c.isnumeric():
            out += c
        else:
            out += lowers[(mmi * (lowers.index(c) - b)) % m]
    return out


def are_coprime(a, b):
    gcd = math.gcd(a, b)
    return math.gcd(a, b) == 1
