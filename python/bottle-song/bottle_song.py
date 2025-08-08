num_map = {
    0: "No",
    1: "One",
    2: "Two",
    3: "Three",
    4: "Four",
    5: "Five",
    6: "Six",
    7: "Seven",
    8: "Eight",
    9: "Nine",
    10: "Ten",
}
def recite(start, take=1):
    out = []
    for i in reversed(range(start - take + 1, start + 1)):
        num_word = num_map[i]
        bottle = "bottle" if i == 1 else "bottles"
        for blah in range(2): out.append(f"{num_word} green {bottle} hanging on the wall,")
        out.append("And if one green bottle should accidentally fall,")
        num_word = num_map[i-1]
        bottle = "bottle" if i == 2 else "bottles"
        out.append(f"There'll be {num_word.lower()} green {bottle} hanging on the wall.")
        out.append("")
    out.pop(-1)
    return out
