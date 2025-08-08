def is_armstrong_number(number):
    digits = list(str(number))
    exp = len(digits)
    total = 0
    for d in digits:
        total += int(d) ** exp
    return total == number
