import math
class ComplexNumber:
    def __init__(self, real=0, imaginary=0):
        self.real = real
        self.imaginary = imaginary

    def __eq__(self=0, other=0):
        return self.real == other.real and self.imaginary == other.imaginary

    def __add__(self=0, other=0):
        if isinstance(self, int): self = ComplexNumber(self, 0)
        if isinstance(other, int): other = ComplexNumber(other, 0)
        real = self.real + other.real
        imaginary = self.imaginary + other.imaginary
        return ComplexNumber(real, imaginary)

    def __mul__(self=0, other=0):
        if isinstance(self, int): self = ComplexNumber(self, 0)
        if isinstance(other, int): other = ComplexNumber(other, 0)
        real = self.real * other.real - self.imaginary * other.imaginary
        imaginary = self.imaginary * other.real + self.real * other.imaginary
        return ComplexNumber(real, imaginary)

    def __sub__(self=0, other=0):
        print("hey")
        if isinstance(self, int): self = ComplexNumber(self, 0)
        if isinstance(other, int): other = ComplexNumber(other, 0)
        real = self.real - other.real
        imaginary = self.imaginary - other.imaginary
        return ComplexNumber(real, imaginary)

    def __truediv__(self=0, other=0):
        if isinstance(self, int): self = ComplexNumber(self, 0)
        if isinstance(other, int): other = ComplexNumber(other, 0)
        real = (self.real * other.real + self.imaginary * other.imaginary) / (other.real ** 2 + other.imaginary ** 2)
        imaginary = (self.imaginary * other.real - self.real * other.imaginary) / (other.real ** 2 + other.imaginary ** 2)
        return ComplexNumber(real, imaginary)

    def __abs__(self=0):
        if isinstance(self, int): self = ComplexNumber(self, 0)
        return math.sqrt(self.real ** 2 + self.imaginary ** 2)

    def conjugate(self=0):
        if isinstance(self, int): self = ComplexNumber(self, 0)
        return ComplexNumber(self.real, -self.imaginary)

    def exp(self):
        pass

print(4 - ComplexNumber(5, 7))
