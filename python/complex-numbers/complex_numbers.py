from math import exp, sin, cos, sqrt
class ComplexNumber:
    def __init__(self, real=0, imaginary=0):
        self.real = real
        self.imaginary = imaginary

    def _force_complex_other(func):
        def wrapper(self, other):
            if isinstance(other, int): other = ComplexNumber(other, 0)
            return func(self, other)
        return wrapper

    @_force_complex_other
    def __eq__(self=0, other=0):
        return self.real == other.real and self.imaginary == other.imaginary


    @_force_complex_other
    def __add__(self=0, other=0):
        real = self.real + other.real
        imaginary = self.imaginary + other.imaginary
        return ComplexNumber(real, imaginary)

    @_force_complex_other
    def __radd__(self, other):
        return other + self

    @_force_complex_other
    def __mul__(self=0, other=0):
        real = self.real * other.real - self.imaginary * other.imaginary
        imaginary = self.imaginary * other.real + self.real * other.imaginary
        return ComplexNumber(real, imaginary)

    @_force_complex_other
    def __rmul__(self, other):
        return other * self

    @_force_complex_other
    def __sub__(self=0, other=0):
        real = self.real - other.real
        imaginary = self.imaginary - other.imaginary
        return ComplexNumber(real, imaginary)

    @_force_complex_other
    def __rsub__(self, other):
        return other - self

    @_force_complex_other
    def __truediv__(self=0, other=0):
        real = (self.real * other.real + self.imaginary * other.imaginary) / (other.real ** 2 + other.imaginary ** 2)
        imaginary = (self.imaginary * other.real - self.real * other.imaginary) / (other.real ** 2 + other.imaginary ** 2)
        return ComplexNumber(real, imaginary)

    @_force_complex_other
    def __rtruediv__(self=0, other=0):
        return other / self

    def __abs__(self=0):
        return sqrt(self.real ** 2 + self.imaginary ** 2)

    def conjugate(self=0):
        return ComplexNumber(self.real, -self.imaginary)

    def exp(self):
        a, b = self.real, self.imaginary
        new_real = exp(a) * cos(b)
        new_imaginary = exp(a) * sin(b)
        return ComplexNumber(new_real, new_imaginary)
