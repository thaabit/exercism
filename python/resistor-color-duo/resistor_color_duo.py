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
def value(colors):
    num1 = mnemonic.index(colors[0])
    num2 = mnemonic.index(colors[1])
    return int(str(num1) + str(num2))
