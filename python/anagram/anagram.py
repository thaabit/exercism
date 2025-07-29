def create_wordset(word):
    wordset = {}
    for char in list(word.lower()):
        wordset[char] = wordset[char] + 1 if char in wordset else 1
    return wordset

def find_anagrams(word, candidates):
    wordset = create_wordset(word)
    anas = []
    for c in candidates:
        cset = create_wordset(c)
        valid = True
        for char in cset:
            if char not in wordset or wordset[char] != cset[char]:
                valid = False
                break
        if valid and c.lower() != word.lower():
            anas.append(c)
    return anas
