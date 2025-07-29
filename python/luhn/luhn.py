import re
class Luhn:
    def __init__(self, card_num):
        self.card_num = re.sub(" ", "", card_num)

    def valid(self):
        if re.search(r"\D", self.card_num): return False
        if len(self.card_num) <= 1: return False
        digits = [*self.card_num[::-1]]
        for i, val in enumerate(digits):
            if i % 2 != 0:
                doubled = (int(val) * 2)
                if doubled > 9: doubled -= 9
                digits[i] = doubled
            else:
                digits[i] = int(val)
        total = sum(digits)
        return total % 10 == 0
