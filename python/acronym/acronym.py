import re
def abbreviate(words):
    parts = re.split(r"[ -]+", words)
    abbr = ''
    for p in parts:
        m = re.match(r"[^A-Za-z]*([A-Za-z])", p)
        abbr += m.group(1).upper()
    return abbr
