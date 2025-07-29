def is_paired(input_string):
    opening_brackets = []
    for char in input_string:
        if char == '(' or char == '[' or char == '{':
            opening_brackets.append(char)
        elif char == ']':
            if len(opening_brackets) == 0 or opening_brackets.pop() != '[':
                return False
        elif char == '}':
            if len(opening_brackets) == 0 or opening_brackets.pop() != '{':
                return False
        elif char == ')':
            if len(opening_brackets) == 0 or opening_brackets.pop() != '(':
                return False

    if len(opening_brackets) != 0: return False
    return True

