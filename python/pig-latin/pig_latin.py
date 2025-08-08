import re
def translate(text):
    out = []
    words = text.split(' ')
    for word in words:
        if re.match("^(xr|yr|yt|[aeiou])", word):
            out.append(word + 'ay')
            continue

        m = re.match("^(.?qu)(.*)$", word)
        if m:
            out.append(m.group(2) + m.group(1) + 'ay')
            continue

        m = re.search("^([^aeiou]+?)([aeiouy].*)$", word)
        if m:
            out.append(m.group(2) + m.group(1) + 'ay')
            continue

    return ' '.join(out)
