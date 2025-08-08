"""
This exercise stub and the test suite contain several enumerated constants.

Enumerated constants can be done with a NAME assigned to an arbitrary,
but unique value. An integer is traditionally used because it’s memory
efficient.
It is a common practice to export both constants and functions that work with
those constants (ex. the constants in the os, subprocess and re modules).

You can learn more here: https://en.wikipedia.org/wiki/Enumerated_type
"""

# Possible sublist categories.
# Change the values as you see fit.
SUBLIST = None
SUPERLIST = None
EQUAL = None
UNEQUAL = None


def is_equal(list_one, list_two):
    equal = False
    if len(list_one) == len(list_two):
        equal = True
        for i in range(len(list_one)):
            if list_one[i] != list_two[i]:
                equal = False
                break
    return equal

def is_sublist(list_one, list_two):
    #print(list_one, list_two)
    if len(list_one) == 0: return True
    if len(list_one) > len(list_two): return False

    starta = list_one[0]
    for idx, valb in enumerate(list_two):
        if starta == valb and len(list_two) >= len(list_one) - idx + 1:
            end = idx + len(list_one)
            slice_two = list_two[idx:end:]
            if is_equal(list_one, slice_two):
                return True
    return False

def sublist(list_one, list_two):

    EQUAL = is_equal(list_one, list_two)
    SUPERLIST = is_sublist(list_two, list_one)
    SUBLIST = is_sublist(list_one, list_two)
    UNEQUAL = not EQUAL and not SUPERLIST and not SUBLIST
    #print(EQUAL, SUBLIST, SUPERLIST, UNEQUAL)

#print(sublist([2, 3, 4], [0, 1, 2, 3, 4, 5]))
