import Foundation

class Diamond {
  static let chars = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")

  static func makeDiamond(letter: Character) -> [String] {
    var out: [String] = []
    let span = chars[...(chars.firstIndex(of: letter)!)]
    let width = span.count - 1
    for (i, char) in span.enumerated() {
        let outside = String(repeating:" ", count:width - i)
        if i == 0 {
            out.append("\(outside)\(char)\(outside)")
        } else {
            let inside = String(repeating:" ", count:i*2 - 1)
            out.append("\(outside)\(char)\(inside)\(char)\(outside)")
        }
    }
    return out + out.dropLast().reversed()
  }
}
