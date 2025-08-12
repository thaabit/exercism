import Foundation

struct Acronym {
  static func abbreviate(_ inString: String) -> String {
    let fixed = inString.replacingOccurrences(of:"-",    with: " ")
                        .replacingOccurrences(of:"_",    with: " ")
                        .replacingOccurrences(of:"\\W",  with: " ")
                        .replacingOccurrences(of:"\\s+", with: " ")

    return fixed.components(separatedBy:" ").reduce("", { x, y in
        x + y.prefix(1).uppercased()
    })
  }
}
