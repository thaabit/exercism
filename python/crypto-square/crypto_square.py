import re
import math
def cipher_text(plain_text):
    cleaned = re.sub(r"\W", "", plain_text).lower()
    c = int(math.sqrt(len(cleaned)))
    if c == 0: return ''
    if c ** 2 < len(cleaned): c = c + 1
    groups = [cleaned[i:i+c] for i in range(0, len(cleaned), c)]
    if not groups: return ''
    groups[-1] = groups[-1].ljust(c, " ")
    inverted = [''.join(l) for l in zip(*groups)]
    return ' '.join(inverted)
