def saddle_points(matrix):
    if len(matrix) > 1:
        prev = matrix[0]
        for m in matrix[1::]:
            if len(m) != len(prev): raise ValueError("irregular matrix")
            prev = m

    possible = []
    for x, row in enumerate(matrix):
        max_row_height = max(row)
        for y, cell_height in enumerate([*row]):
            if cell_height == max_row_height:
                column = [r[y] for r in matrix]
                min_col_height = min(column)
                if cell_height <= min_col_height:
                    possible.append({"row": x+1, "column": y+1})

    return possible
