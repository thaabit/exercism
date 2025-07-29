def transform(legacy_data):
    out = {}
    for num in legacy_data:
        for letter in legacy_data[num]:
            out[letter.lower()] = num
    return out
