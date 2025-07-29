def append(list1, list2):
    for i in list2:
        list1.append(i)
    return list1


def concat(lists):
    master_list = []
    for l in lists:
        append(master_list, l)
    return master_list


def filter(function, list):
    final = []
    for i in list:
        if function(i):
            final.append(i)
    return final


def length(list):
    len = 0
    for i in list:
        len += 1
    return len


def map(function, list):
    for i, val in enumerate(list):
        list[i] = function(val)
    return list


def foldl(function, list, initial):
    if length(list) == 0: return initial
    val = function(initial, list.pop(0))
    return foldl(function, list, val)


def foldr(function, list, initial):
    if length(list) == 0: return initial
    val = function(initial, list.pop())
    return foldr(function, list, val)


def reverse(list):
    reversed = []
    for i in list:
        reversed.insert(0, i)
    return reversed
