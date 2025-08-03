// Write your code for the 'TwoFer' exercise in this file.
func twoFer(name: String? = nil) -> String {
    if let name = name {
        return "One for \(name), one for me."
    } else {
        return "One for you, one for me."
    }
}
