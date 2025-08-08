def convert(number):
    resp = ''
    if number % 3 == 0:
        resp = resp + 'Pling'
    if number % 5 == 0:
        resp = resp + 'Plang'
    if number % 7 == 0:
        resp = resp + 'Plong'
    return resp if resp else str(number)
