def flatten(iterable):
    final = []
    recurse(iterable, final)
    return final


def recurse(iterable, final):
    for i in iterable:
        if type(i) == list:
            recurse(i, final)
        elif i is None:
            next
        else:
            final.append(i)
