from itertools import permutations

nationalities = ['Englishman', 'Spaniard', 'Ukrainian', 'Norwegian', 'Japanese']
colors = ['red', 'green', 'yellow', 'blue', 'ivory']
pets = ['dog', 'snails', 'fox', 'horse', 'zebra']
drinks = ['coffee', 'tea', 'water', 'milk', 'orange juice']
smokes = ['Old Gold', 'Kools', 'Chesterfields', 'Lucky Strike', 'Parliaments']

for n in permutations(nationalities):
    if n[0] != 'Norwegian': continue #10
    for c in permutations(colors):
        if c.index('green') != c.index('ivory') + 1: continue #6
        if abs(n.index('Norwegian') - c.index('blue')) != 1: continue #15
        if n.index('Englishman') != c.index('red'): continue #2
        for p in permutations(pets):
            if n.index('Spaniard') != p.index('dog'): continue #3
            for d in permutations(drinks):
                if d.index('milk') != 2: continue #9
                if d.index('coffee') != c.index('green'): continue #4
                if d.index('tea') != n.index('Ukrainian'): continue #5
                for s in permutations(smokes):
                    if s.index('Old Gold') != p.index('snails'): continue #7
                    if s.index('Kools') != c.index('yellow'): continue #8
                    if abs(s.index('Chesterfields') - p.index('fox')) != 1: continue #11
                    if abs(s.index('Kools') - p.index('horse')) != 1: continue #12
                    if s.index('Lucky Strike') != d.index('orange juice'): continue #13
                    if s.index('Parliaments') != n.index('Japanese'): continue #14
                    nationalities, colors, pets, drinks, smokes = n, c, p, d, s

def drinks_water():
    return nationalities[drinks.index('water')]


def owns_zebra():
    return nationalities[pets.index('zebra')]
