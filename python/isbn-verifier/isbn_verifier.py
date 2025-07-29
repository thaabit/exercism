import re
def is_valid(isbn):
    isbn = re.sub("-","", isbn)
    d = list(isbn)
    if len(d) != 10: return False
    if d[9] == 'X': d[9] = 10
    for i, val in enumerate(d):
        try: d[i] = int(val)
        except: return False
    total = d[0] * 10 + d[1] * 9 + d[2] * 8 + d[3] * 7 + d[4] * 6 + d[5] * 5 + d[6] * 4 + d[7] * 3 + d[8] * 2 + d[9] * 1
    return total % 11 == 0

