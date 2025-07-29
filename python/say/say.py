rows = {
    "ones": ["","one","two","three","four","five","six","seven","eight","nine"],
    "tens": ["ten","eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"],
    "twenties": ["","","twenty","thirty","forty","fifty","sixty","seventy","eighty","ninety"]
}

def say(number):
    if number < 0 or number >= 1_000_000_000_000:
        raise ValueError("input out of range")
    if number == 0:
        return 'zero'

    list_number = [*str(number)]
    num_digits = len(list_number)
    groups = [('billion', 9), ('million', 6), ('thousand', 3), ('', 0)]
    out = ''
    for g in groups:
        text, count = g[0], g[1]
        if num_digits > count:
            num = ''
            num += list_number[-(count + 3)] if num_digits > count + 2 else ''
            num += list_number[-(count + 2)] if num_digits > count + 1 else ''
            num += list_number[-(count + 1)]
            ninety_nine = to_ninety_nine(num)
            if ninety_nine:
                out += ' ' if out else ''
                out += ninety_nine
                if text != '': out += ' ' + text
    return out


def to_ninety_nine(number):
    list_number = [*str(number)]
    num_digits = len(list_number)
    ones = int(list_number[-1]) if num_digits > 0 else 0
    tens = int(list_number[-2]) if num_digits > 1 else 0
    hundreds = int(list_number[-3]) if num_digits > 2 else 0

    out = ''
    if hundreds > 0:
        out = rows["ones"][hundreds] + ' hundred'
    if tens > 1:
        out += ' ' if out else ''
        out += rows["twenties"][tens]
    elif tens == 1:
        out += ' ' if out else ''
        out += rows["tens"][ones]

    if ones > 0 and tens != 1:
        if tens > 1: out += "-"
        out += rows["ones"][ones]

    return out
