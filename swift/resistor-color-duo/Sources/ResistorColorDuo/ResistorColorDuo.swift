import Foundation
enum ResistorError: Error {
    case invalidColor
}

let color_list = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]
enum ResistorColorDuo {
    static func value(for colors: [String]) throws -> Int {
        let first = String(color_list.firstIndex(of: colors[0])!)
        let second = String(color_list.firstIndex(of: colors[1])!)
        guard let i = Int(first + second) else { throw ResistorError.invalidColor }
        return i
    }
}
