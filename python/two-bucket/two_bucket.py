def measure(bucket_one, bucket_two, goal, start_bucket):
    if (goal > bucket_one and goal > bucket_two):
        raise ValueError("too big")

    possibles = list()
    if start_bucket == "one":
        _measure(bucket_one, bucket_one, bucket_two, 0, 1, goal, start_bucket, set(), possibles)
        if possibles: return min(possibles)
        else: raise ValueError("impossible")
    else:
        _measure(bucket_one, 0, bucket_two, bucket_two, 1, goal, start_bucket, set(), possibles)
        if possibles: return min(possibles)
        else: raise ValueError("impossible")

def _measure(b1_size, b1_amt, b2_size, b2_amt, actions, goal, start_bucket, seen, possibles):
    _tuple = (b1_size, b1_amt, b2_size, b2_amt)
    if _tuple in seen: return
    seen.add(_tuple)
    if b1_amt == goal:
        possibles.append((actions, "one", b2_amt))
        return
    if b2_amt == goal:
        possibles.append((actions, "two", b1_amt))
        return
    # empty b1
    if b1_amt > 0 and not (start_bucket == "one" and b2_amt == b2_size):
        if _measure(b1_size, 0, b2_size, b2_amt, actions + 1, goal, start_bucket, seen, possibles):
            return
    # empty b2
    if b2_amt > 0 and not (start_bucket == "two" and b1_amt == b1_size):
        if _measure(b1_size, b1_amt, b2_size, 0, actions + 1, goal, start_bucket, seen, possibles):
            return
    # fill b1
    if b1_amt < b1_size and not (start_bucket == "two" and b2_amt == 0):
        if _measure(b1_size, b1_size, b2_size, b2_amt, actions + 1, goal, start_bucket, seen, possibles):
            return
    # fill b2
    if b2_amt < b2_size and not (start_bucket == "one" and b1_amt == 0):
        if _measure(b1_size, b1_amt, b2_size, b2_size, actions + 1, goal, start_bucket, seen, possibles):
            return
    # pour b1 into b2
    if b1_amt > 0 and b2_amt < b2_size:
        _b1_amt = 0
        _b2_amt = b1_amt + b2_amt
        if _b2_amt > b2_size:
            _b1_amt = _b2_amt - b2_size
            _b2_amt = b2_size
        if not (start_bucket == "one" and _b2_amt == b2_size and _b1_amt == 0):
            if _measure(b1_size, _b1_amt, b2_size, _b2_amt, actions + 1, goal, start_bucket, seen, possibles):
                return

    # pour b2 into b1
    if b2_amt > 0 and b1_amt < b1_size:
        _b2_amt = 0
        _b1_amt = b2_amt + b1_amt
        if _b1_amt > b1_size:
            _b2_amt = _b1_amt - b1_size
            _b1_amt = b1_size
        if not (start_bucket == "two" and _b1_amt == b1_size and _b2_amt == 0):
            if _measure(b1_size, _b1_amt, b2_size, _b2_amt, actions + 1, goal, start_bucket, seen, possibles):
                return

    return
