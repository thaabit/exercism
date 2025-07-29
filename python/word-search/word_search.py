class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __eq__(self, other):
        return self.x == other.x and self.y == other.y


class WordSearch:
    def __init__(self, puzzle):
        self.height = len(puzzle)
        self.width = len(puzzle[0])
        self.puzzle = puzzle

    def search(self, word):
        directions = ((0, -1), (0, 1), (1, 0), (-1, 0), (1, 1), (-1, 1), (1, -1), (-1, -1))
        for y, line in enumerate(self.puzzle):
            for x, char in enumerate(line):
                if char == word[0]:
                    begin = Point(x, y)
                    for d in directions:
                        end = self.find_next(word[1:], x + d[0], y + d[1], d)
                        if end: return (begin, end)
        return None

    def find_next(self, word, x, y, direction):
        if (0 <= x < self.width) and (0 <= y < self.height):
            char = self.puzzle[y][x]
            if char == word[0]:
                if len(word) == 1: return Point(x,y)
                else: return self.find_next(word[1:], x + direction[0], y + direction[1], direction)
            else: return None
