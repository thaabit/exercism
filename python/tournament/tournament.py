from collections import defaultdict
def tally(rows):
    tallies = defaultdict(int)
    for row in rows:
        teama, teamb, result = row.split(";")
        matches[teama]['matches'] += 1
        matches[teamb]['matches'] += 1
        if result == 'win':
            tallies[teama]['points'] += 3
            tallies[teama]['wins'] += 1
        elif result == 'loss':
            tallies[teamb]['points'] += 3
            tallies[teamb]['wins'] += 1
        elif result == 'draw':
            tallies[teama]['draws'] += 1
            tallies[teamb]['draws'] += 1
            tallies[teama]['points'] += 1
            tallies[teamb]['points'] += 1
    results = ["Team                           | MP |  W |  D |  L |  P"]
    string_ = ["|{:<20}|{:^4}||{:^4}|{:^4}|{:^4}|{:>4}"]
    for row in sorted(tallies.items(), key = lambda x: (-x['points'], x[0])):

        print(row)



print(tally(['Devastating Donkeys;Blithering Badgers;win', 'Devastating Donkeys;Blithering Badgers;win', 'Devastating Donkeys;Blithering Badgers;win', 'Devastating Donkeys;Blithering Badgers;win', 'Blithering Badgers;Devastating Donkeys;win']))
