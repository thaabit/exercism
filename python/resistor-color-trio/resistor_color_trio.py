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
def label(colors):
    num1 = mnemonic.index(colors[0])
    num2 = mnemonic.index(colors[1])
    zeros = int(mnemonic.index(colors[2]))
    out = str(num1) + str(num2)
    out = out.ljust(zeros + len(out), '0')
    num = int(out)
    tag = 'ohms'
    if num and num % 1000 == 0:
        num = num / 1000
        tag = 'kiloohms'
        if num % 1000 == 0:
            num = num / 1000
            tag = 'megaohms'
            if num % 1000 == 0:
                num = num / 1000
                tag = 'gigaohms'
    num = int(num)
    return f"{num} {tag}"
