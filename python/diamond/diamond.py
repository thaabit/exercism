import string
def rows(letter):
    letters = [*string.ascii_uppercase]
    idx = letters.index(letter)
    width = idx * 2 + 1
    left = int(width / 2)
    right = left
    rows = []
    for letter in letters[0:idx + 1]:
        row = ''
        for i in range(width):
            if i == left or i == right:
                row += letter
            else:
                row += ' '
        left -= 1
        right += 1
        rows.append(row)
    rows = rows + rows[-2::-1]
    return rows

