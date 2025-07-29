def rebase(input_base, digits, output_base):
    if input_base < 2: raise ValueError("input base must be >= 2")
    if output_base < 2: raise ValueError("output base must be >= 2")

    for d in list(digits):
        if d < 0 or d >= input_base: raise ValueError("all digits must satisfy 0 <= d < input base")

    power, base10 = 0, 0
    for d in reversed(list(digits)):
        base10 += d * input_base ** power
        power += 1

    output = []
    for power in range(int(base10 / output_base) + 1):
        output.append(int(base10 / output_base ** power) % output_base)
    if len(output) == 0: output.append(0)
    output.reverse()
    while output[0] == 0 and len(output) > 1: output.pop(0)

    return output
