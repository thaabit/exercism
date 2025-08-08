import re
MIN_INDEX = 0
class ConnectGame:
    def __init__(self, board):
        rows = [list(re.sub(r"\s+", "", r)) for r in board.split("\n")]
        self.rows = rows
        self.cols = [list(x) for x in zip(*rows)]

    def get_winner(self):
        self.seen = []
        for i, c in enumerate(self.cols[0]):
            if c == 'X':
                if self.check(0, i, 'X', self.cols):
                    return 'X'
        for i, c in enumerate(self.rows[0]):
            if c == 'O':
                if self.check(0, i, 'O', self.rows):
                    return 'O'
        return ''

    def check(self, row, col, char, rows):
        max_index = len(rows) - 1
        if row == max_index and rows[row][col] == char: return True
        rows[row][col] = 'F' + char

        ok_right = col < max_index
        ok_left = col > MIN_INDEX
        ok_top = row > MIN_INDEX
        ok_bottom = row < max_index

        # top left
        if ok_top and rows[row - 1][col] == char:
            if self.check(row - 1, col, char, rows): return True
        # top right
        if ok_top and ok_right and rows[row - 1][col + 1] == char:
            if self.check(row - 1, col, char, rows): return True
        # right
        if ok_right and rows[row][col + 1] == char:
            if self.check(row, col + 1, char, rows): return True
        # left
        if ok_left and rows[row][col - 1] == char:
            if self.check(row, col - 1, char, rows): return True
        # bottom left
        if ok_left and ok_bottom and rows[row + 1][col - 1] == char:
            if self.check(row + 1, col - 1, char, rows): return True
        # bottom right
        if ok_bottom and rows[row + 1][col] == char:
            if self.check(row + 1, col, char, rows): return True

        return False
