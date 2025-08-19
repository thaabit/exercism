let DEFAULT_VALUE = -1
func spiralMatrix(size: Int) -> [[Int]] {
    if size == 0 { return [] }
    let dirs = [(0,1),(1,0),(0,-1),(-1,0)]
    var dirIndex = 0, num = 1, point = (0,0)
    var out = Array(repeating: Array(repeating: DEFAULT_VALUE, count: size), count: size)
    while true {
        if !available(point,out) { break }
        out[point.0][point.1] = num
        num += 1
        if !available((point.0 + dirs[dirIndex].0, point.1 + dirs[dirIndex].1), out) {
            dirIndex = (dirIndex + 1) % 4
        }
        point = (point.0 + dirs[dirIndex].0, point.1 + dirs[dirIndex].1)
    }
    return out
}

func available(_ point:(Int,Int), _ matrix:[[Int]]) -> Bool {
    let size = matrix.count
    if point.0 >= size || point.0 < 0 || point.1 >= size || point.1 < 0 {
        return false
    } else if matrix[point.0][point.1] != DEFAULT_VALUE {
        return false
    }
    return true
}
