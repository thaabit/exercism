import Foundation

extension String {
    subscript(i: Int) -> String {
        String(self[index(startIndex, offsetBy: i)])
    }
}

func cryptoSquare(text: String) -> String {
    let text = text.lowercased().replacingOccurrences(of:"\\W", with:"", options:.regularExpression)
    let rows = Int(sqrt(Double(text.count)).rounded(.up))
    let cols = rows * (rows - 1) >= text.count ? rows - 1 : rows
    var strings = [String]()
    for x in 0..<rows {
        strings.append("")
        for y in 0..<cols {
            let offset = x + y * rows
            strings[x] += offset >= text.count ? " " : text[offset]
        }
    }
    return strings.joined(separator:" ")
}
