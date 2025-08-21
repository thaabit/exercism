import Foundation

extension String {
    func match<T:RegexComponent>(_ regex: T) -> Bool { return self.wholeMatch(of:regex) != nil }
    var isVowels:Bool { self.wholeMatch(of:#/[aeiou]/#) != nil }
    var isConsonants:Bool { self.wholeMatch(of:#/^y?[^aeiouy]*$/#) != nil }
}

extension StringProtocol {
    subscript(bounds: CountableClosedRange<Int>) -> String {
        guard bounds.count <= self.count else { return "" }
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(start, offsetBy: bounds.count)
        return String(self[start..<end])
    }

    subscript(bounds: CountableRange<Int>) -> String {
        guard bounds.count <= self.count else { return "" }
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(start, offsetBy: bounds.count)
        return String(self[start..<end])
    }

    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}

class PigLatin {
    static func translate(_ input: String) -> String {
        var out = [String]()
        for word in input.components(separatedBy:" ") {
            let one = word[0]
            let two = word[0...1]
            let three = word[0...2]
            if one.isVowels || two.match(#/(xr|yt)/#) {
                out.append(word + "ay")
            }
            else if three != "" && (three.isConsonants || three.match(#/.qu/#)) {
                out.append(word[3..<word.count] + three + "ay")
            }
            else if two.isConsonants || two.match(#/qu/#) || three.match(#/..y/#) {
                out.append(word[2..<word.count] + two + "ay")
            }
            else if one.isConsonants || two.match(#/.y/#) {
                out.append(word[1..<word.count] + one + "ay")
            }
        }
        return out.joined(separator:" ")

    }
}
