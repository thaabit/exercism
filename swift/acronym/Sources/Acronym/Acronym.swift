import Foundation

struct Acronym {
  static func abbreviate(_ inString: String) -> String {
    var fixed = inString.replacingOccurrences(of:"-", with: " ")
    fixed = fixed.replacingOccurrences(of: "_", with: " ")
    fixed = fixed.replacingOccurrences(of: "\\W", with: " ")
    fixed = fixed.replacingOccurrences(of: "\\s+", with: " ")
    var a = ""
    for word in fixed.components(separatedBy:" ") {
        a += word.prefix(1).uppercased()
    }
    return a
  }
}
