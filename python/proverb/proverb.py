def proverb(*args, qualifier=""):
    wordlist = [*args]
    out = []
    if not len(wordlist): return out
    first = wordlist[0]
    one = wordlist.pop(0)
    if len(wordlist):
        two = wordlist.pop(0)
        while 1:
            out.append(f"For want of a {one} the {two} was lost.")
            if not len(wordlist): break
            one = two
            two = wordlist.pop(0)
    if not qualifier: qualifier = ""
    else: qualifier += ' '
    out.append(f"And all for the want of a {qualifier}{first}.")
    return out
