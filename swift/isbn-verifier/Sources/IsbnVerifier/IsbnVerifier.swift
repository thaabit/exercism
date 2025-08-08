class IsbnVerifier {
  static func isValid(_ string: String) -> Bool {
    var d : [Int] = []
    for c in Array(string) {
        if c == "-" {
            continue
        } else if c == "X" {
            d.append(10)
            break
        } else if let num = Int(String(c)) {
            d.append(num)
        } else {
            return false
        }
    }
    var total = 0
    guard d.count == 10 else { return false }
    for (idx, val) in d.enumerated() {
        total += (10 - idx) * val
    }
    return total % 11 == 0
  }
}
