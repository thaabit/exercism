import re
def rotate(text, key):
    chars = list(text)
    output = ''
    for char in chars:
        if re.match("[A-Z]", char):
            code = (ord(char) + key)
            if code > 90:
                code = (code % 90) + 64
            output += chr(code)
        elif re.match("[a-z]", char):
            code = (ord(char) + key)
            if code > 122:
                code = (code % 122) + 96
            output += chr(code)
        else:
            output += char
    return output
