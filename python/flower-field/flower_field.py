from itertools import product
FLOWER = "*"
def annotate(garden):
    for y, row in enumerate(garden):
        if len(row) != len(garden[0]): raise ValueError("The board is invalid with current input.")
        new_row = ""
        for x, square in enumerate(list(row)):
            if square == " ":
                flowers = 0
                for dir in product([0,1,-1], repeat=2):
                    new_y = y + dir[1]
                    new_x = x + dir[0]
                    inbounds = new_y >= 0 and new_x >= 0 and new_y < len(garden) and new_x < len(garden[0])
                    if inbounds and garden[new_y][new_x] == FLOWER: flowers += 1
                new_row += str(flowers) if flowers > 0 else " "
            elif square == FLOWER:
                new_row += FLOWER
            else: raise ValueError("The board is invalid with current input.")
        garden[y] = new_row
    return garden
