class Queen:
    def __init__(self, row, column):
        if row < 0: raise ValueError("row not positive")
        if row > 7: raise ValueError("row not on board")
        if column < 0: raise ValueError("column not positive")
        if column > 7: raise ValueError("column not on board")
        self.row = row
        self.column = column

    def can_attack(self, another_queen):
        same_col = self.column == another_queen.column
        same_row = self.row == another_queen.row
        if same_col and same_row: raise ValueError("Invalid queen position: both queens in the same square")
        if same_col or same_row: return True
        if self.row + self.column == another_queen.row + another_queen.column: return True
        if self.row - self.column == another_queen.row - another_queen.column: return True
        return False

