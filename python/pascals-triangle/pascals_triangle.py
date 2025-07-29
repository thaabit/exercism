triangle = []
def rows(row_count):
    global triangle
    triangle = []
    if row_count < 0: raise ValueError("number of rows is negative")
    pascal(row_count)
    return triangle

def pascal(rows_left):
    global triangle
    if rows_left == 0: return
    if not triangle:
        triangle.append([1])
    else:
        prev = triangle[-1]
        cur = []
        for i in range(len(prev) + 1):
            before = prev[i - 1] if i > 0 else 0
            after = prev[i] if i < len(prev) else 0
            cur.append(before + after)
        triangle.append(cur)
    return pascal(rows_left - 1)
