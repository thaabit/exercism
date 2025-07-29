vals = [
    (["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"], 1),
    (["D", "G"], 2),
    (["B", "C", "M", "P"], 3),
    (["F", "H", "V", "W", "Y"], 4),
    (["K"], 5),
    (["J", "X"], 8),
    (["Q", "Z"], 10),
]
score_map = {}
for val in vals:
    for letter in val[0]:
        score_map[letter] = val[1]
def score(word):
    score = 0
    for letter in [*word]:
        score += score_map[letter.upper()]
    return score

