enum OcrNumberError:Error {
    case invalidInput
}

let nums = [
    " _ | ||_|", // 0
    "     |  |", // 1
    " _  _||_ ", // 2
    " _  _| _|", // 3
    "   |_|  |", // 4
    " _ |_  _|", // 5
    " _ |_ |_|", // 6
    " _   |  |", // 7
    " _ |_||_|", // 8
    " _ |_| _|", // 9
]
class OcrNumber {
    static func convert(rows: [String]) throws -> String {

        guard rows.count % 4 == 0 else { throw OcrNumberError.invalidInput }
        guard rows[0].count % 3 == 0 else { throw OcrNumberError.invalidInput }

        var out:[String] = []
        let cols = Int(rows[0].count)
        for row in stride(from:0, to:rows.count - 1, by:4) {
            var line = ""
            let three_rows = (0...2).map { Array(rows[row + $0]) }
            for col in stride(from:0, to:cols, by:3) {
                let numString = three_rows.reduce("", { acc, next in
                    acc + String(next[col...col+2])
                })
                if let numIdx = nums.firstIndex(of:numString) {
                    line += String(numIdx)
                } else {
                    line += "?"
                }
            }
            out.append(line)
        }
        return out.joined(separator:",")
    }
}
