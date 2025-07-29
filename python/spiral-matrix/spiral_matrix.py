def spiral_matrix(size):
    if size == 0: return []
    if size == 1: return [[1]]
    matrix = []
    for i in range(size):
        matrix.append([])
        for j in range(size):
            matrix[i].append('')
    go_right(0, 0, matrix, size, 1)
    return matrix

def go_right(row, col, matrix, size, number):
    if matrix[row][col] != '': return
    matrix[row][col] = number
    number += 1
    if col + 1 >= size or matrix[row][col + 1] != '':
        go_down(row + 1, col, matrix, size, number)
    elif col + 1 <= size:
        go_right(row, col + 1, matrix, size, number)

def go_down(row, col, matrix, size, number):
    if matrix[row][col] != '': return
    matrix[row][col] = number
    number += 1
    if row + 1 >= size or matrix[row + 1][col] != '':
        go_left(row, col - 1, matrix, size, number)
    else:
        go_down(row + 1, col, matrix, size, number)

def go_left(row, col, matrix, size, number):
    if matrix[row][col] != '': return
    matrix[row][col] = number
    number += 1
    if col - 1 < 0 or matrix[row][col - 1] != '':
        go_up(row - 1, col, matrix, size, number)
    else:
        go_left(row, col - 1, matrix, size, number)

def go_up(row, col, matrix, size, number):
    if matrix[row][col] != '': return
    matrix[row][col] = number
    number += 1
    if row - 1 < 0 or matrix[row - 1][col] != '':
        go_right(row, col + 1, matrix, size, number)
    else:
        go_up(row - 1, col, matrix, size, number)

