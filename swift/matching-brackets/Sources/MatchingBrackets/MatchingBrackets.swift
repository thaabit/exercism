class MatchingBrackets {
    static func paired(text: String) -> Bool {

        var stack = [Character]()
        let brackets:[Character:Character] = [
            "(": ")",
            "[": "]",
            "{": "}",
        ]

        for char in Array(text) {
            if brackets.keys.contains(char) {
                stack.append(char)
            } else if brackets.values.contains(char) {
                guard stack.count > 0 else { return false }
                guard brackets[stack.removeLast()] == char else { return false }
            }
        }

        return stack.isEmpty
    }
}
