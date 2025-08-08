import re
def transpose(lines):
    lines = lines.split("\n")
    num_lines = len(lines)
    anything_left = True
    char_index = 0
    groups = []
    while anything_left:
        anything_left = False
        out = ''
        for i in range(num_lines):
            cur_line = lines[i]
            if len(cur_line) > char_index:
                char = cur_line[char_index]
                out += '|' if char == ' ' else char
                if len(cur_line) > char_index + 1: anything_left = True
            else:
                out += ' '
        out = re.sub(r"\s+$", "", out)
        out = re.sub(r"\|", " ", out)
        groups.append(out)
        char_index += 1
    return "\n".join(groups)
