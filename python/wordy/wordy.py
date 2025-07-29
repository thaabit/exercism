import re

def do_operation(numbers, operations):
    if len(operations) == 0: return int(numbers[0])
    num1 = int(numbers.pop(0))
    num2 = int(numbers.pop(0))
    op = operations.pop(0)
    if op == 'minus':
        numbers.insert(0, num1 - num2)
    elif op == 'plus':
        numbers.insert(0, num1 + num2)
    elif op == 'divided':
        numbers.insert(0, num1 / num2)
    elif op == 'multiplied':
        numbers.insert(0, num1 * num2)


def is_number(word):
    return re.match("^-?\\d+$", word)

def is_operation(word, words):
    if re.match(r"^(multiplied|divided)$", word):
        by = words.pop(0)
        if by != 'by':
            raise ValueError("unknown operation")
        return True
    elif word == 'minus' or word == 'plus':
        return True
    return False

def answer(question):
    words = question.split(' ')
    one, two = words.pop(0).lower(), words.pop(0)
    one = re.sub("\\?$","", one)
    two = re.sub("\\?$","", two)
    if (one != 'what' or two != 'is'):
        raise ValueError("unknown operation")

    expected, numbers, ops = 'num', [], []

    while len(words):
        word = words.pop(0)
        word = re.sub("\\?$","", word)
        if is_number(word):
            if expected != 'num':
                raise ValueError("syntax error")
            numbers.append(int(word))
            expected = 'op'
        elif is_operation(word, words):
            if expected != 'op':
                raise ValueError("syntax error")
            ops.append(word)
            expected = 'num'
        else:
            raise ValueError("unknown operation")

        if len(numbers) == 2 and len(ops) == 1:
            do_operation(numbers, ops)
    if not len(numbers):
        raise ValueError("syntax error")
    if len(ops):
        raise ValueError("syntax error")
    return numbers[0]

