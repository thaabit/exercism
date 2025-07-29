def annotate(minefield):
    #minefield = [list(x) for x in minefield]
    output = []
    len_row = len(minefield[0]) if len(minefield) else 0
    for y, row in enumerate(minefield):
        if len(row) != len_row: raise ValueError("The board is invalid with current input.")
        new_row = ''
        for x, val in enumerate(list(row)):
            if val == ' ':
                bombs = 0

                left_ok = x > 0
                right_ok = x < (len_row - 1)

                next_row = minefield[y + 1] if y < (len(minefield) - 1) else None
                has_next = next_row is not None
                prev_row = minefield[y - 1] if y > 0 else None
                has_prev = prev_row is not None

                if has_next and next_row[x] == '*': bombs += 1
                if has_prev and prev_row[x] == '*': bombs += 1
                if right_ok and row[x + 1] == '*': bombs += 1
                if left_ok  and row[x - 1] == '*': bombs += 1

                if has_next and right_ok and next_row[x + 1] == '*': bombs += 1
                if has_next and left_ok  and next_row[x - 1] == '*': bombs += 1
                if has_prev and right_ok and prev_row[x + 1] == '*': bombs += 1
                if has_prev and left_ok  and prev_row[x - 1] == '*': bombs += 1

                new_row += str(bombs) if bombs > 0 else ' '
            elif val == '*':
                new_row += val
            else:
                raise ValueError("The board is invalid with current input.")
        output.append(new_row)
    return output
