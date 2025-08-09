enum QueenError : Error {
    case inValidRow
    case inValidColumn
}

class Queen {
  var row:Int
  var column:Int

  init (row: Int, column: Int) throws {
    guard row >= 0 && row < 8 else { throw QueenError.inValidRow }
    guard column >= 0 && column < 8 else { throw QueenError.inValidColumn }
    self.row = row
    self.column = column
  }
  func canAttack(other: Queen) -> Bool {
    if self.row == other.row || self.column == other.column {
        return true
    } else if abs(self.row - other.row) == abs(self.column - other.column) {
        return true
    }
    return false
  }
}
