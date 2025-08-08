import re
class PhoneNumber:
    def __init__(self, number):
        number = re.sub(r"[ .()+-]", "", number)
        if re.search(r"[A-Za-z]", number): raise ValueError("letters not permitted")
        if re.search(r"\D", number): raise ValueError("punctuations not permitted")
        if len(number) == 11:
            if not re.search(r"^1", number): raise ValueError("11 digits must start with 1")
            number = re.sub(r"^1", "", number)
        number_set = [*number]

        self.area_code = ''.join(number_set[0:3])
        if len(number) < 10: raise ValueError("must not be fewer than 10 digits")
        if len(number) > 10: raise ValueError("must not be greater than 11 digits")
        if number_set[3] == '0': raise ValueError("exchange code cannot start with zero")
        if number_set[3] == '1': raise ValueError("exchange code cannot start with one")
        if number_set[0] == '0': raise ValueError("area code cannot start with zero")
        if number_set[0] == '1': raise ValueError("area code cannot start with one")
        self.number = number

    def pretty(self):
        number_set = [*self.number]
        return "(" + ''.join(number_set[0:3]) + ")-" + ''.join(number_set[3:6]) + "-" + ''.join(number_set[6::])
