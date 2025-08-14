import Foundation

func isPangram(_ text: String) -> Bool {
  Set(Array(text.lowercased().replacingOccurrences(of:"[^a-z]", with:"", options:.regularExpression))).count == 26
}
