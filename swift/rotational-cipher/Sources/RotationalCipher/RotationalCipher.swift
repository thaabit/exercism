import Foundation
func rotateCipher(_ input: String, shift: Int) -> String {
  var out = ""
  for c in Array(input) {
    let av = Int(c.asciiValue ?? 0)
    var shifted = av + shift
    let lower = av >= 97 && av <= 122
    let upper = av >= 65 && av <= 90

    if upper || lower {
        if lower && shifted > 122 || upper && shifted > 90 { shifted -= 26 }
        out += String(UnicodeScalar(shifted)!)
    } else {
        out += String(c)
    }
  }
  return out
}
