def egg_count(display_value):
    binary = bin(display_value)
    eggs = [*binary][2::]
    return sum(int(i) for i in eggs)
