from collections import defaultdict
OPPOSITES = {'win': 'loss', 'loss': 'win', 'draw': 'draw'}
def tally(rows):

    # calculate results
    tallies = defaultdict(int)
    for row in rows:
        teama, teamb, result = row.split(";")
        add_result(teama, result, tallies)
        add_result(teamb, OPPOSITES[result], tallies)

    # build output
    results = ["Team                           | MP |  W |  D |  L |  P"]
    string_ = "{:<30} | {:>2} | {:>2} | {:>2} | {:>2} | {:>2}"
    for row in sorted(tallies.items(), key = lambda x: (-x[1]['points'], x[0])):
        team, r = row
        line = string_.format(team, r['matches'], r['wins'], r['draws'], r['losses'], r['points'])
        results.append(line)

    return results


def add_result(team, result, tallies):
    if not team in tallies.keys():
        tallies[team] = {'matches': 0, 'wins': 0, 'draws':0, 'losses':0, 'points':0}
    tallies[team]['matches'] += 1
    if result == 'win':
        tallies[team]['points'] += 3
        tallies[team]['wins'] += 1
    elif result == 'loss':
        tallies[team]['losses'] += 1
    elif result == 'draw':
        tallies[team]['draws'] += 1
        tallies[team]['points'] += 1

print(tally(['Devastating Donkeys;Blithering Badgers;win', 'Devastating Donkeys;Blithering Badgers;win', 'Devastating Donkeys;Blithering Badgers;win', 'Devastating Donkeys;Blithering Badgers;win', 'Blithering Badgers;Devastating Donkeys;win']))
