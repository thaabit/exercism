numbers = [
    [" _ ","| |","|_|"], # 0
    ["   ","  |","  |"], # 1
    [" _ "," _|","|_ "], # 2
    [" _ "," _|"," _|"], # 3
    ["   ","|_|","  |"], # 4
    [" _ ","|_ "," _|"], # 5
    [" _ ","|_ ","|_|"], # 6
    [" _ ","  |","  |"], # 7
    [" _ ","|_|","|_|"], # 8
    [" _ ","|_|"," _|"], # 9
]
def convert(input_grid):
    num_rows = len(input_grid)
    if num_rows % 4 != 0: raise ValueError("Number of input lines is not a multiple of four")
    for row in input_grid:
        if len(row) % 3 != 0: raise ValueError("Number of input columns is not a multiple of three")
    num_columns = int(len(input_grid[0]) / 3)
    out = []
    for x in range(int(num_rows/4)):
        if x > 0: out.append(',')
        for y in range(num_columns):
            number = [row[y*3:y*3+3] for row in input_grid[x*4:x*4+3]]
            found = False
            for i, pattern in enumerate(numbers):
                if number == pattern:
                    out.append(str(i))
                    found = True
                    break
            if not found: out.append('?')
    return ''.join(out)
