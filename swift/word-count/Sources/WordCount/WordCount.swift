import Foundation

class WordCount {
    var words:String

    init(words:String) {
        self.words = words
    }

    func count() -> [String:Int] {
        var out:[String:Int] = [:]
        words = words.replacingOccurrences(of:"[!&@$%^&,\n]", with:" ", options:.regularExpression)
        for word in self.words.components(separatedBy: " ") {
            let word = word.replacingOccurrences(of:"\\W+$", with:"", options:.regularExpression)
                       .replacingOccurrences(of:"^\\W+", with:"", options:.regularExpression)
            guard word.count > 0 else { continue }
            out[word.lowercased(), default:0] += 1
        }
        return out
    }
}
