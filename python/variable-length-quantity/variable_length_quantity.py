import string
import math
def encode(numbers):
    output = []
    for n in numbers:
        b = bin(n)[2:]
        num_septets = math.ceil(len(b)/7)
        start = 0
        end = len(b) % 7 if len(b) % 7 != 0 else start + 7
        for i in range(num_septets):
            septet = b[start:end]
            septet = septet.rjust(7,'0')
            octet = '1' + septet if i < num_septets - 1 else '0' + septet
            output.append(int(octet, 2))
            start = end
            end = start + 7
    return output


def decode(bytes_):
    num, output = '', []
    marker = None
    for b in bytes_:
        octet = bin(b)[2:].rjust(8, '0')
        marker = octet[0:1]
        septet = octet[1:]
        num += septet
        if marker == '0':
            output.append(int(num, 2))
            num = ''
    if marker == '1': raise ValueError("incomplete sequence")
    return output
