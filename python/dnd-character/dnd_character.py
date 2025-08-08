import random
import math

class Character:
    def __init__(self):
        self.strength = self.ability()
        self.dexterity = self.ability()
        self.constitution = self.ability()
        self.intelligence = self.ability()
        self.wisdom = self.ability()
        self.charisma = self.ability()
        self.hitpoints = 10 + modifier(self.constitution)


    def ability(self):
        rolls = []
        for i in range(4):
            rolls.append(random.randint(1,6))
        rolls.remove(min(rolls))
        return sum(rolls)

def modifier(val):
    return math.floor((val - 10) / 2)
