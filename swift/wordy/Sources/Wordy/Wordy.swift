import Foundation
enum WordyError:Error {
    case syntaxError
}

// simplified regex replace
extension String {
    func replace(_ match:String, _ replace:String) -> String {
        String(self.replacingOccurrences(of:match, with:replace, options:.regularExpression))
    }
}

func wordyAnswer(_ question: String) throws -> Int {
    var parts = question.replace("What is ","")
                        .replace("\\?$","")
                        .replace(" by","")
                        .components(separatedBy:" ")

    guard var result = Int(parts.removeFirst()) else { throw WordyError.syntaxError }

    while !parts.isEmpty {
        let op = parts.removeFirst()
        if parts.isEmpty { throw WordyError.syntaxError }
        guard let digit = Int(parts.removeFirst()) else { throw WordyError.syntaxError }
        switch op {
            case "plus":       result += digit
            case "minus":      result -= digit
            case "divided":    result /= digit
            case "multiplied": result *= digit
            default: throw WordyError.syntaxError
        }
    }
    return result
}
