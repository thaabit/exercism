enum CollatzConjectureError: Error {
    case invalidNumber
}
class CollatzConjecture {
  static func steps(_ number: Int) throws -> Int? {
    guard number > 0 else { throw CollatzConjectureError.invalidNumber }
    var steps = 0
    var n = number
    func collatzify() {
        if n == 1 { return }
        n = n % 2 == 0 ? n / 2 : n * 3 + 1
        steps += 1
        collatzify()
    }
    collatzify()
    return steps
  }
}
