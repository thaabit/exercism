import re
def response(hey_bob):
    is_q = len(hey_bob) > 0 and re.search("\?\s*$", hey_bob)
    silence = re.search("^\s*$", hey_bob)
    yelling = not silence and not re.search('[a-z]', hey_bob) and re.search('[A-Z]', hey_bob)
    if is_q and yelling:
        return 'Calm down, I know what I\'m doing!'
    elif is_q:
        return 'Sure.'
    elif yelling:
        return 'Whoa, chill out!'
    elif silence:
        return 'Fine. Be that way!'
    else:
        return 'Whatever.'
