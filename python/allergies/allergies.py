ordered = ["eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"]
class Allergies:

    def __init__(self, score):
        self.score = score
        self.binary = [True if i == '1' else False for i in list(bin(score+256))[2::][::-1]]

    def allergic_to(self, item):
        return item in self.lst

    @property
    def lst(self):
        out = []
        for i, food in enumerate(ordered):
            if self.binary[i]:
                out.append(food)
        return out
