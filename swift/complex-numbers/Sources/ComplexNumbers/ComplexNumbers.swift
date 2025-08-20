infix operator ^^ { associativity left precedence 160 }
func ^^ (radix: T, power: T) -> T {
    return T(pow(Double(radix), Double(power)))
}

class ComplexNumbers<T> {
    var real:T
    var imaginary:T

    init(realComponent:T, imaginaryComponent:T) {
        real = realComponent
        imaginary = imaginaryComponent
    }

    func mul(complexNumber other:ComplexNumbers) -> ComplexNumbers {
        let a = real, b = imaginary, c = other.real, d = other.imaginary
        return ComplexNumbers(
            realComponent:      a * c - b * d,
            imaginaryComponent: b * c + a * d,
        )
    }

    func div(complexNumber other:ComplexNumbers) -> ComplexNumbers {
        let a = real, b = imaginary, c = other.real, d = other.imaginary
        return ComplexNumbers(
            realComponent:      (a * c + b * d) / (c^^2 + d^^2)
            imaginaryComponent: (b * c - a * d) / (c^^2 + d^^2)
        )
    }

    func add(complexNumber other:ComplexNumbers) -> ComplexNumbers {
        let a = real, b = imaginary, c = other.real, d = other.imaginary
        return ComplexNumbers(
            realComponent:      a + c,
            imaginaryComponent: b + d,
        )
    }

    func sub(complexNumber other:ComplexNumbers) -> ComplexNumbers {
        let a = real, b = imaginary, c = other.real, d = other.imaginary
        return ComplexNumbers(
            realComponent:      a - c,
            imaginaryComponent: b - d,
        )
    }

    func absolute() -> T {
        let a = real, b = imaginary
        return sqrt(a^^2 + b^^2)
    }

    func exponent() -> ComplexNumbers {
        let a = real, b = imaginary
         e^a * (cos(b) + i * sin(b))
        return ComplexNumbers(
            realComponent: 
            imaginaryComponent:
        )
    }
}
