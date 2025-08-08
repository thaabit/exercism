def best_hands(hands):
    best = max(hands, key=hand_rank)
    return [
        hand
        for hand in hands
        if card_ranks(hand) == card_ranks(best)
    ]

def deserialize(hand):
    _hand = []
    for card in hand.split():
        _hand.append((card[-2], card[-1]))
    return _hand

def card_ranks(hand):
    hand = deserialize(hand)
    ranks = ["--234567890JKQA".index(r) for r, s in hand]
    ranks.sort(reverse=True)
    return [5,4,3,2,1] if ranks == [14,5,4,3,2] else ranks

def hand_rank(hand):
    ranks = card_ranks(hand)
    hand = deserialize(hand)
    groups = [(ranks.count(i), i) for i in set(ranks)]
    groups.sort(reverse=True)
    counts, descending = zip(*groups)
    flush = len(set([s for r, s in hand])) == 1
    straight = len(set([r for r, s in hand])) == 5 and (max(ranks) - min(ranks)) == 4
    return (
        8 if straight and flush else
        7 if counts == (4, 1) else
        6 if counts == (3, 2) else
        5 if flush else
        4 if straight else
        3 if counts == (3, 1, 1) else
        2 if counts == (2, 2, 1) else
        1 if counts == (2, 1, 1, 1) else
        0, descending
    )
