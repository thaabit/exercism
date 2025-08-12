import Foundation

enum BaseError:Error {
    case invalidInputBase, invalidOutputBase, negativeDigit, invalidPositiveDigit
}

struct Base {
  static func outputDigits(inputBase: Int, inputDigits: [Int], outputBase: Int) throws -> [Int] {

    guard inputBase  > 1 else { throw BaseError.invalidInputBase }
    guard outputBase > 1 else { throw BaseError.invalidOutputBase }

    var base10 = try inputDigits.reversed().enumerated().reduce(0, {
        let acc = $0, exp = $1.0, digit = $1.1
        guard digit >= 0 else { throw BaseError.negativeDigit }
        guard digit < inputBase else { throw BaseError.invalidPositiveDigit }

        return acc + digit * Int(pow(Double(inputBase), Double(exp)))
    })

    var out:[Int]()
    while base10 > 0 {
        out.append(base10 % outputBase)
        base10 /= outputBase
    }
    if out.isEmpty { out.append(0) }
    return out.reversed()
  }
}
