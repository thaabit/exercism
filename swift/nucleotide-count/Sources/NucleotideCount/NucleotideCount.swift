enum NucleotideCountErrors: Error {
    case invalidNucleotide
}

class DNA {
  var counts = [
    "A": 0,
    "C": 0,
    "G": 0,
    "T": 0,
  ]
  init(strand:String) {
    try! Array(strand).forEach {
        let char = String($0)
        guard counts[char] != nil else {
            throw NucleotideCountErrors.invalidNucleotide
        }
        counts[char]! += 1
    }
  }
}
