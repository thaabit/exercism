import re
def decode(string):
    lst = [*string]
    prev, counter, out = None, 1, ''
    while len(lst):
        char = lst.pop(0)
        if re.match(r"\d", char):
            counter = char
            while len(lst) and re.match(r"\d", lst[0]):
                counter += lst.pop(0)
            counter = int(counter)
        else:
            for i in range(counter):
                out += char
            counter = 1
    return out

def encode(string):
    lst = [*string]
    prev, counter, out = None, 0, ''
    for i, char in enumerate(lst):
        final = (i == len(lst) - 1)
        new_char = (char != prev)
        if prev and new_char:
            if counter > 1:
                out += str(counter) + prev
            else:
                out += prev
            counter = 0
        prev = char
        counter += 1
    if counter > 1:
        out += str(counter) + prev
    elif counter == 1:
        out += prev
    return out
