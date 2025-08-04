enum HammingError: Error {
    case unequalLengths
}
func compute(_ dnaSequence: String, against: String) throws -> Int? {
  guard dnaSequence.count == against.count else { throw HammingError.unequalLengths }

  let b = Array(against)
  var hamming = 0
  for (i, val) in Array(dnaSequence).enumerated() {
    if val != b[i] { hamming += 1 }
  }
  return hamming
}
