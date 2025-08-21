class MatchingBrackets {
    static func paired(text: String) -> Bool {

        var stack = [Character]()
        let openers = Array("([{")
        let closers = Array(")]}")

        for char in Array(text) {
            if openers.contains(char) {
                stack.append(char)
            } else if closers.contains(char) {
                guard stack.count > 0 else { return false }
                guard openers.firstIndex(of:stack.removeLast())! == closers.firstIndex(of:char)! else { return false }
            }
        }

        return stack.isEmpty
    }
}
