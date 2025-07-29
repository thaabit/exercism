from string import ascii_lowercase
from random import choice
class Cipher:
    def __init__(self, key=None):
        if not key:
            key = ''
            for i in range(100):
                key += choice(ascii_lowercase)
        self.key = key
        self.key_list = list(key)

    def encode(self, text):
        chars = list(text)
        out = []
        for i, char in enumerate(chars):
            offset = ord(self.key_list[i % len(self.key_list)]) - ord('a')
            out.append(chr((ord(char) - 97 + offset) % 26 + 97))
        return ''.join(out)

    def decode(self, text):
        chars = list(text)
        out = []
        for i, char in enumerate(chars):
            offset = ord(self.key_list[i % len(self.key_list)]) - ord('a')
            out.append(chr((ord(char) - 97 - offset) % 26 + 97))
        return ''.join(out)
