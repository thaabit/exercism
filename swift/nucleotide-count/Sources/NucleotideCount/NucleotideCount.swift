enum NucleotideCountErrors: Error {
    case invalidNucleotide
}

class DNA {
  var _counts = [
    "A": 0,
    "C": 0,
    "G": 0,
    "T": 0,
  ]
  var strand: String = ""

  init(strand:String) throws {
    print(strand)
    try Array(strand).forEach {
        let char = String($0)
        guard self._counts[char] != nil else {
            throw NucleotideCountErrors.invalidNucleotide
        }
        self._counts[char]! += 1
    }
  }

  func counts() -> [String: Int] {
    self._counts
  }
}
