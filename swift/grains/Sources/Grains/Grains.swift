import Foundation

enum GrainsError: Error {
    case inputTooLow
    case inputTooHigh
}
struct Grains {
  static func square(_ num: Int) throws -> UInt64 {
    if num < 1  { throw GrainsError.inputTooLow  }
    if num > 64 { throw GrainsError.inputTooHigh }

    return UInt64(pow(2.0, Double(num - 1)))
  }

  static var total : UInt64 = {
    (1...64).reduce(UInt64(0), { result, next in
        if let s = try? Grains.square(next) {
            return result + s
        }
        return 0
    })
  }()
}
