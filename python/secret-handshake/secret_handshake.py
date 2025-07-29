actions = [
    'wink',
    'double blink',
    'close your eyes',
    'jump',
    'reverse'
]
def commands(binary_str):
    digits = list(binary_str)
    to_do = []
    for i in range(5):
        digit = digits.pop()
        action = actions[i]
        if digit == '1':
            if action == 'reverse':
                to_do.reverse()
            else:
                to_do.append(action)

    return to_do
