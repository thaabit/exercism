import Foundation
func rotateCipher(_ input: String, shift: Int) -> String {
  var out = ""
  for c in Array(input) {
    var c = c
    let av = c.asciiValue!
    if av >= 97 && av <= 122 {
        c = Character(UnicodeScalar((av + shift) % 95)!)
    } else if av >= 65 && av <= 90 {
        c = Character(UnicodeScalar((av + shift) % 65)!)
    }
    out += String(c)
  }
  return out
}
