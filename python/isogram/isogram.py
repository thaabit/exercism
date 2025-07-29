import re
def is_isogram(string):
    string = re.sub("[\\W.]", "", string).lower()
    chars = list(string)
    already_seen = set()
    for char in chars:
        if char in already_seen: return False
        already_seen.add(char)
    return True
