class SaddlePoints {
    static func saddlePoints(_ grid:[[Int]]) -> [Position] {
        var out:[Position] = []
        for (x, row) in grid.enumerated() {
            let max = row.max()
            for (y, val) in row.enumerated() {
                if val == max {
                    var isSaddle = true
                    for i in 0..<grid.count {
                        if i == x { continue }
                        if val > grid[i][y] {
                            isSaddle = false
                            break
                        }
                    }
                    if isSaddle == true {
                        out.append(Position(row:x+1, column:y+1))
                    }
                }
            }
        }
        return out
    }
}
