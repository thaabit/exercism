animals = [
    ('fly', "I don't know why she swallowed the fly. Perhaps she'll die."),
    ('spider', "It wriggled and jiggled and tickled inside her."),
    ('bird', "How absurd to swallow a bird!"),
    ('cat', "Imagine that, to swallow a cat!"),
    ('dog', "What a hog, to swallow a dog!"),
    ('goat', "Just opened her throat and swallowed a goat!"),
    ('cow', "I don't know how she swallowed a cow!"),
    ('horse', "She's dead, of course!"),

]
def recite(start_verse, end_verse):
    verses = []
    for i in range(start_verse - 1, end_verse):
        animal, line = animals[i]
        verses.append(f"I know an old lady who swallowed a {animal}.")
        verses.append(line)
        if 0 < i < 7:
            for j in range(i, 0, -1):
                cur = animals[j][0]
                prev = animals[j - 1][0]
                line = f"She swallowed the {cur} to catch the {prev}"
                line += " that wriggled and jiggled and tickled inside her." if prev == 'spider' else "."
                verses.append(line)
            verses.append(animals[0][1])
        if i < end_verse - 1: verses.append("")

    return verses
