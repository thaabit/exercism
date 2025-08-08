import Foundation

func splitOnNewlines(_ poem: String) -> [String] {
    poem.components(separatedBy:"\n")
}

func frontDoorPassword(_ phrase: String) -> String {
    splitOnNewlines(phrase).reduce("") { (partial, cur_line) in
        let trimmed = cur_line.trimmingCharacters(in: .whitespacesAndNewlines)
        if let char = trimmed.first {
            return partial + String(char)
        } else {
            return partial + "_"
        }
    }
}

func backDoorPassword(_ phrase: String) -> String {
    let pw = splitOnNewlines(phrase).reduce("") { (partial, cur_line) in
        let trimmed = cur_line.trimmingCharacters(in: .whitespacesAndNewlines)
        if let char = trimmed.last {
            return partial + String(char)
        } else {
            return partial + "_"
        }
    }
    return pw + ", please"
}

func secretRoomPassword(_ phrase: String) -> String {
    let pw = splitOnNewlines(phrase).enumerated().reduce("") { (partial, cur_line) in
        let (index, cur_line) = cur_line
        let trimmed = cur_line.trimmingCharacters(in: .whitespacesAndNewlines)
        let char = trimmed[trimmed.index(trimmed.startIndex, offsetBy: index)]
        return partial + String(char)
    }
    return pw.uppercased + "!"
}
