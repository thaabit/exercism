import Foundation
import RealModule

infix operator ^^ : MultiplicationPrecedence
func ^^ (radix: Double, power: Double) -> Double {
    return Double(pow(Double(radix), Double(power)))
}

class ComplexNumbers {
    var real:Double
    var imaginary:Double

    init(realComponent:Double, imaginaryComponent:Double?) {
        real = realComponent
        imaginary = imaginaryComponent ?? 0
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
            realComponent:      (a * c + b * d) / (c^^2 + d^^2),
            imaginaryComponent: (b * c - a * d) / (c^^2 + d^^2),
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

    func absolute() -> Double {
        let a = real, b = imaginary
        return sqrt(a^^2 + b^^2)
    }

    func exponent() -> ComplexNumbers {
        let a = real, b = imaginary
        return ComplexNumbers(
            realComponent:      exp(a) * cos(b),
            imaginaryComponent: exp(a) * sin(b),
        )
    }

    func conjugate() -> ComplexNumbers {
        let a = real, b = imaginary
        return ComplexNumbers(
            realComponent:      a,
            imaginaryComponent: -b,
        )
    }
    static func ==(lhs: ComplexNumbers, rhs: ComplexNumbers) -> Bool {
        let tlr = 0.00001
        return lhs.real.isApproximatelyEqual(to:rhs.real, absoluteTolerance:tlr) &&
               lhs.imaginary.isApproximatelyEqual(to:rhs.imaginary, absoluteTolerance:tlr)
    }
}
