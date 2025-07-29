def slices(series, length):
    if length == 0: raise ValueError("slice length cannot be zero")
    if length < 0: raise ValueError("slice length cannot be negative")
    if len(str(series)) == 0: raise ValueError("series cannot be empty")
    if length > len(str(series)): raise ValueError("slice length cannot be greater than series length")

    lst, start, seq = [*str(series)], 0, []
    while length <= len(lst):
        seq.append(''.join(lst[start:length]))
        start += 1
        length += 1
    return seq

print(slices(1234, 3))
