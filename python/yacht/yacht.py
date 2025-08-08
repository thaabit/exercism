# Score categories.
# Change the values as you see fit.
YACHT = 'yacht'
ONES = 'ones'
TWOS = 'twos'
THREES = 'threes'
FOURS = 'fours'
FIVES = 'fives'
SIXES = 'sixes'
FULL_HOUSE = 'full_house'
FOUR_OF_A_KIND = 'four_of_a_kind'
LITTLE_STRAIGHT = 'little_straight'
BIG_STRAIGHT = 'big_straight'
CHOICE = 'choice'


def singles(dice, num):
    return sum(num if d == num else 0 for d in dice)

def is_yacht(dice):
    base = dice[1]
    for d in dice:
        if d != base: return False
    return True

def four_of_a_kind(dice):
    count = {}
    for d in dice:
        count[d] = count[d] + 1 if d in count else 1
    for key, val in count.items():
        if val >= 4: return 4 * key
    return 0

def full_house(dice):
    count, prev, index = {}, 0, 0
    for d in dice:
        count[d] = count[d] + 1 if d in count else 1
    twos, threes = False, False
    for key, val in count.items():
        if val == 2: twos = True
        if val == 3: threes = True
    return sum(dice) if twos and threes else 0

def little_straight(dice):
    for i, d in enumerate(sorted(dice)):
        if d != i + 1: return 0
    return 30

def big_straight(dice):
    for i, d in enumerate(sorted(dice)):
        if d != i + 2: return 0
    return 30

def score(dice, category):
    match category:
        case "yacht": return 50 if is_yacht(dice) else 0
        case "ones": return singles(dice, 1)
        case "twos": return singles(dice, 2)
        case "threes": return singles(dice, 3)
        case "fours": return singles(dice, 4)
        case "fives": return singles(dice, 5)
        case "sixes": return singles(dice, 6)
        case "full_house": return 0 if is_yacht(dice) else full_house(dice)
        case 'four_of_a_kind': return four_of_a_kind(dice)
        case 'little_straight': return little_straight(dice)
        case 'big_straight': return big_straight(dice)
        case 'choice': return sum(dice)
