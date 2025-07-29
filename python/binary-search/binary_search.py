def find(search_list, value):
    if not len(search_list): raise ValueError("value not in array")
    search_list = sorted(search_list)
    index = int(len(search_list) / 2)
    seen = set()
    min_index, max_index = 0, len(search_list)
    while 1:
        cmp = search_list[index]
        if cmp == value:
            return index
        elif cmp < value:
            min_index = index
            index = int((index + max_index) / 2)
        else:
            max_index = index
            index = int((index + min_index) / 2)
        if index in seen: raise ValueError("value not in array")
        seen.add(index)
