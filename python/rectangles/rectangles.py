valid_cols = ['|', '+']
valid_rows = ['-', '+']
def rectangles(strings):
    count = 0
    for row, s in enumerate(strings):
        for i, char in enumerate(list(s)):
            if char == '+' and i < len(s) - 1:
                count += check_horizontal(i, row, s, strings)
    return count

def check_horizontal(start_index, start_row, string, strings):
    count = 0
    for i, char in enumerate(string[start_index + 1::]):
        if char == '-':
            continue
        elif char == '+':
            count += check_vertical(start_index, i + start_index + 1, start_row, strings)
        else:
            break
    return count

def check_vertical(start_index, end_index, start_row, strings):
    count = 0
    for row, s in enumerate(strings[start_row + 1::]):
        if s[start_index] == s[end_index] == '+':
            if all(char in valid_rows for char in s[start_index:end_index]):
                count += 1
        elif s[start_index] in valid_cols and s[end_index] in valid_cols:
            continue
        else:
            return count
    return count
