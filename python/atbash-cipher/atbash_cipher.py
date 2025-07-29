import string
import re
normal = [*string.ascii_lowercase]
atbash = [*normal]
atbash.reverse()
mapping = {}
reverse_mapping = {}
for i, char in enumerate(normal):
    mapping[char] = atbash[i]
    reverse_mapping[atbash[i]] = char

for i in range(10):
    mapping[str(i)] = str(i)
    reverse_mapping[str(i)] = str(i)

def encode(plain_text):
    encoded = ''
    counter = 0
    for char in plain_text.lower():
        if char == ' ': continue
        if char in mapping:
            encoded += mapping[char]
            counter += 1
            if counter % 5 == 0:
                encoded += ' '
    encoded = re.sub(r"\s+$", "", encoded)
    return encoded


def decode(ciphered_text):
    decoded = ''
    for char in ciphered_text.lower():
        if char == ' ': continue
        if char in reverse_mapping:
            decoded += reverse_mapping[char]
    return decoded
