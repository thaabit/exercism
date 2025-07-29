import re
mnemonic = [
    "black",
    "brown",
    "red",
    "orange",
    "yellow",
    "green",
    "blue",
    "violet",
    "grey",
    "white"
]
tolerances = {
    'grey': '0.05%',
    'violet': '0.1%',
    'blue': '0.25%',
    'green': '0.5%',
    'brown': '1%',
    'red': '2%',
    'gold': '5%',
    'silver': '10%'
}
def is_positive_integer(n):
    is_int = False
    if isinstance(n, int):
        is_int = True
    if isinstance(n, float):
        is_int = n.is_integer()
    return is_int and n > 0

def label(colors):
    if len(colors) < 3: return "0 ohms"
    num1 = mnemonic.index(colors.pop(0))
    num2 = mnemonic.index(colors.pop(0))
    num3 = mnemonic.index(colors.pop(0)) if len(colors) > 2 else ''

    zeros = int(mnemonic.index(colors.pop(0)))
    out = str(num1) + str(num2) + str(num3)
    out = out.ljust(zeros + len(out), '0')
    num = int(out)
    tag = 'ohms'
    if num and num / 1000 > 1:
        num = num / 1000
        tag = 'kiloohms'
        if num / 1000 > 1:
            num = num / 1000
            tag = 'megaohms'
            if num / 1000 > 1:
                num = num / 1000
                tag = 'gigaohms'
    num = int(num) if is_positive_integer(num) else num
    return f"{num} {tag}"

def resistor_label(colors):
    out = label(colors)
    t = colors.pop(0) if len(colors) >= 1 else 'blah'
    if t in tolerances:
        tolerance = tolerances[t]
        out += f" ±{tolerance}"
    return out
