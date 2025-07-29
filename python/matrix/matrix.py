class Matrix:
    def __init__(self, matrix_string):
        self.rows, self.cols = [], []
        for x, line in enumerate(matrix_string.split("\n")):
            row = [int(i) for i in line.split(' ')]
            self.rows.append(row)
            if not len(self.cols): self.cols = [[] for i in row]
            for y, val in enumerate(row):
                self.cols[y].append(val)

    def row(self, index):
        if len(self.rows) < index: raise ValueError("blah")
        return self.rows[index - 1]

    def column(self, index):
        if len(self.cols) < index: raise ValueError("blah")
        return self.cols[index - 1]
