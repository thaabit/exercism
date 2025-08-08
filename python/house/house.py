verses = [
    ('', 'the horse and the hound and the horn'),
    ('belonged to', 'the farmer sowing his corn'),
    ('kept', 'the rooster that crowed in the morn'),
    ('woke', 'the priest all shaven and shorn'),
    ('married', 'the man all tattered and torn'),
    ('kissed', 'the maiden all forlorn'),
    ('milked', 'the cow with the crumpled horn'),
    ('tossed', 'the dog'),
    ('worried', 'the cat'),
    ('killed', 'the rat'),
    ('ate', 'the malt'),
    ('lay in', 'the house that Jack built.'),
]
verses.reverse()

def do_line(i, first=False):
    lines = []
    lines.append("This is " + verses[i][1])
    for i in reversed(range(0, i)):
        lines.append("that " + verses[i][0] + ' ' + verses[i][1])
    return ' '.join(lines)

def recite(start_verse, end_verse):
    out = []
    for i in reversed(range(start_verse - 1, end_verse)):
        out.append(do_line(i))

    out.reverse()
    return out

