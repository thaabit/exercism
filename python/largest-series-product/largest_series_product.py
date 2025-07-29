from functools import reduce
import re
def largest_product(series, size):
    if re.search(r"\D", series): raise ValueError("digits input must only contain digits")
    if size <= 0: raise ValueError("span must not be negative")
    if size > len(series): raise ValueError("span must be smaller than string length")
    start = 0
    end = size
    span = [int(x) for x in series[start:end]]
    cur = max_ = reduce(lambda x, y: x*y, span)
    while end < len(series):
        start += 1
        end += 1
        former_first = span[0]
        span = [int(x) for x in series[start:end]]
        if cur == 0:
            cur = reduce(lambda x, y: x*y, span)
        else:
            cur = int(cur / former_first) * span[-1]
        if cur > max_: max_ = cur
    return max_
