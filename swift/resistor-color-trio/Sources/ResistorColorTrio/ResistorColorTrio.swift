import Foundation


enum ResistorColorTrio {
    static let colors = [
        "black",
        "brown",
        "red",
        "orange",
        "yellow",
        "green",
        "blue",
        "violet",
        "grey",
        "white",
    ]
    static func label(for colors:[String]) -> String {
        var numString:String = ""
        numString += String(ResistorColorTrio.colors.firstIndex(of: colors[0])!)
        numString += String(ResistorColorTrio.colors.firstIndex(of: colors[1])!)
        let zeroes = ResistorColorTrio.colors.firstIndex(of: colors[2])!
        if zeroes > 0 {
            for _ in 1...zeroes { numString += "0" }
        }

        var num = Int(numString)!
        var units = "ohms"
        if num > 1_000_000_000 {
            num /= 1_000_000_000
            units = "gigaohms"
        } else if num > 1_000_000 {
            num /= 1_000_000
            units = "megaohms"
        } else if num > 1_000 {
            num /= 1_000
            units = "kiloohms"
        }
        return "\(num) \(units)"
    }
}
