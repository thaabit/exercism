import Foundation

enum Plant: String {
    case clover   = "C"
    case grass    = "G"
    case radishes = "R"
    case violets  = "V"
}
extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}

class Garden {
    let children = ["Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"]
    let garden : [String]
    init (_ gardenString: String) {
        garden = gardenString.components(separatedBy: "\n")
    }
    func plantsForChild(_ name: String) -> [Plant] {
        let startIdx = children.firstIndex(of: name)! * 2
        var out: [Plant] = []
        for row in garden {
            out.append(Plant(rawValue: String(row[startIdx]))!)
            out.append(Plant(rawValue: String(row[startIdx + 1]))!)
        }
        return out
    }
}
