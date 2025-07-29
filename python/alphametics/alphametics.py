def solve(puzzle):
    chars = []
    lines = []
    for word in puzzle.split(' '):
        if word == '==' or word == '+': continue
        else:
            lines.append(word)
            for char in word:
                if char not in chars: chars.append(char)
    for x in range(1, 10):
        result = replace(chars[0], str(x), lines[::], chars[1::], dict())
        if result: return result
    return

def replace(char, num, lines, chars, _hash):

    for line in lines:
        if line.find(num) != -1: return

    # replace the char
    _hash[char] = int(num)
    for i, line in enumerate(lines):
        lines[i] = line.replace(char, num)

    # base case, no chars left to replace
    if len(chars) == 0:
        lines = list(map(int, lines))
        if sum(lines[0:-1]) == lines[-1]:
            return _hash
        else: return

    start = 0
    for line in lines:
        if line[0] == chars[0]:
            start = 1
            break

    for x in range(start, 10):
        result = replace(chars[0], str(x), lines[::], chars[1::], _hash.copy())
        if result: return result
