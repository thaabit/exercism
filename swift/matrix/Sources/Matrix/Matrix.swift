import Foundation

struct Matrix {
  var rows:[[Int]] = []
  var columns:[[Int]] = []
  init (_ matrixString: String) {
    for (rowidx, line) in matrixString.components(separatedBy:"\n").enumerated() {
        let row = line.components(separatedBy:" ").map { Int($0)! }
        rows.append(row)
        for (i, val) in row.enumerated() {
            if rowidx == 0 { columns.append([val]) } else { columns[i].append(val) }
        }
    }
  }
}
