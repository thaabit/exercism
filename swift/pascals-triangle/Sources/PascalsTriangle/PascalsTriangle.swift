func pascalsTriangle(rows: Int) -> [[Int]] {
    var out = [[Int]]()
    var prev_row = [Int]()
    if rows == 0 { return [] }
    for rowLen in 1...rows {
        var row = [Int]()
        for y in 1...rowLen {
            if y == 1 || y == rowLen {
                row.append(1)
            } else {
                row.append(prev_row[y-2] + prev_row[y-1])
            }
        }
        out.append(row)
        prev_row = row
    }
    return out
}
