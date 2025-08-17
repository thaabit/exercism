import Foundation

func isValidLuhn(_ number: String) -> Bool {
    let number = number.replacingOccurrences(of:"\\s", with:"", options:.regularExpression)
    guard number.wholeMatch(of: #/\d+/#) != nil else { return false }
    guard number.count > 1 else { return false }
    return Array(number).map({Int(String($0))!}).reversed().enumerated().reduce(0) { acc, current in
        let idx = current.0, el = current.1
        var digit = idx % 2 != 0 ? el * 2 : el
        if digit > 9 { digit -= 9 }
        return acc + digit
    } % 10 == 0
}
