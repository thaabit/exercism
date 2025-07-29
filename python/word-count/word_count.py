import re
def count_words(sentence):
    words = re.split(r"[\s:!\"_,]+", sentence)
    resp = {}
    for word in words:
        word = word.lower()
        word = re.sub(r"(^'+|'+$|[.,&@$%^]+)", "", word)
        if word != '':
            resp[word] = 1 if word not in resp else resp[word] + 1
    return resp

