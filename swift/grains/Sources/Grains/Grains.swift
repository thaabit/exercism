import Foundation

enum GrainsError: Error {
    case inputTooLow
    case inputTooHigh
}
struct Grains {
  static var total : UInt64 {
    get { (1...64).reduce(UInt64(0), { sum, square in sum + grains(square) }) }
  }
  static func square(_ square: Int) throws -> UInt64 {
    guard square >= 1  else { throw GrainsError.inputTooLow  }
    guard square <= 64 else { throw GrainsError.inputTooHigh }

    return grains(square)
  }
  private static func grains(_ square: Int) -> UInt64 {
      UInt64(pow(2.0, Double(square - 1)))
  }

}
