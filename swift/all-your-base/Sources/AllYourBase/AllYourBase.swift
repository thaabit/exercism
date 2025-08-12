struct Base {
  static func outputDigits(inputBase: Int, inputDigits: [Int], outputBase: Int) throws -> [Int] {
    let total = inputDigits.reversed().enumerated().reduce(0, { acc, (i, d) in
        acc + d * pow(d, i)
    })
    var exp = 0
    while total > 0 {
        row = total / pow(outputBase, exp)

  }
}
