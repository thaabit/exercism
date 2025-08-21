let directions = [(0,1),(1,1),(1,0),(0,-1),(-1,-1),(-1,0),(-1,1),(1,-1)] // left, right, up, down, 4 diagonals
let SPACE = " "

// allows for indexing a String with an Int
extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}

class Board {
    var rows:[String]

    init(_ input:[String]) {
        self.rows = input
    }

    func transform() -> [String] {
        let height = rows.count
        var out = Array(repeating:"", count:height)
        for (y, row) in rows.enumerated() {
            let squares = Array(row), width = squares.count
            for (x, square) in squares.enumerated() {
                if square.isWhitespace {
                    var flowers = 0
                    for d in directions {
                        let newX = d.0 + x, newY = d.1 + y
                        guard newX >= 0 && newX < width && newY >= 0 && newY < height else { continue }
                        if rows[newY][newX] == "*" { flowers += 1 }
                    }
                    out[y].append(flowers > 0 ? String(flowers) : SPACE)
                } else if square == "*" {
                    out[y].append("*")
                }
            }
        }
        return out
    }
}
