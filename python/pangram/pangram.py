import string
def is_pangram(sentence):
    lower = sentence.lower()
    string_chars = set(lower)
    all_chars = set(string.ascii_lowercase)
    return all_chars <= string_chars
