from math import exp, log
class Rational:
    def __init__(self, numer, denom):
        if denom < 0:
            numer = numer * -1
            denom = denom * -1
        numer_divisors = []
        denom_divisors = []
        for i in range(2, abs(numer) + 1):
            if numer % i == 0: numer_divisors.append(i)
        for i in range(2, abs(denom) + 1):
            if denom % i == 0: denom_divisors.append(i)
        for i in numer_divisors[::-1]:
            if i in denom_divisors:
                numer = int(numer/i)
                denom = int(denom/i)
                break
        if numer == 0: denom = 1
        self.numer = numer
        self.denom = denom


    def __eq__(self, other):
        return self.numer == other.numer and self.denom == other.denom

    def __repr__(self):
        return f'{self.numer}/{self.denom}'

    def __add__(self, other):
        return Rational(self.numer * other.denom + self.denom * other.numer, self.denom * other.denom)

    def __sub__(self, other):
        return Rational(self.numer * other.denom - self.denom * other.numer, self.denom * other.denom)

    def __mul__(self, other):
        return Rational(self.numer * other.numer, self.denom * other.denom)

    def __truediv__(self, other):
        return Rational(self.numer * other.denom, self.denom * other.numer)

    def __abs__(self):
        return Rational(abs(self.numer), abs(self.denom))

    def __pow__(self, power):
        if power < 0:
            power = abs(power)
            return Rational(self.denom ** power, self.numer ** power)
        else:
            return Rational(self.numer ** power, self.denom ** power)


    def __rpow__(self, base):
        return exp(log(base ** self.numer) / self.denom)
