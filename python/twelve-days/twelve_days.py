gifts = [
    ("first", "a Partridge in a Pear Tree."),
    ("second", "two Turtle Doves"),
    ("third", "three French Hens"),
    ("fourth", "four Calling Birds"),
    ("fifth", "five Gold Rings"),
    ("sixth", "six Geese-a-Laying"),
    ("seventh", "seven Swans-a-Swimming"),
    ("eighth", "eight Maids-a-Milking"),
    ("ninth", "nine Ladies Dancing"),
    ("tenth", "ten Lords-a-Leaping"),
    ("eleventh", "eleven Pipers Piping"),
    ("twelfth", "twelve Drummers Drumming"),
]
def recite(start_verse, end_verse):
    out = []
    for i in range(start_verse - 1, end_verse):
        gift = gifts[i]
        line = 'On the ' + gift[0] + ' day of Christmas my true love gave to me: ' + gift[1]
        if i > 0:
            line += ', '
            extra = [g[1] for g in gifts[i - 1::-1]]
            extra[-1] = 'and ' + extra[-1]
            line += ', '.join(extra)
        out.append(line)
    return out
