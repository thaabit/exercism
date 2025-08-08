class Bob {
    static func response(_ message: String) -> String {
        let message = message.replacing(/\s*$/, with: "")
        let isQuestion = message.hasSuffix("?")
        let isSilence  = message.wholeMatch(of: /^\s*$/) != nil
        let onlyLetters = message.replacing(/[\W\d]/, with: "")
        let isYelling  = onlyLetters.wholeMatch(of: /^[A-Z]+$/) != nil

        if isYelling && isQuestion {
            return "Calm down, I know what I'm doing!"
        } else if isYelling {
            return "Whoa, chill out!"
        } else if isQuestion {
            return "Sure."
        } else if isSilence {
            return "Fine. Be that way!"
        } else {
            return "Whatever."
        }
    }
}
