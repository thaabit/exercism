from random import choice, randint
import string
class Robot:
    names = set()
    def __init__(self):
        self.reset()

    def rand_name(self):
        letters = string.ascii_uppercase
        name = choice(letters) + choice(letters)
        for i in range(3):
            name += str(randint(0,9))
        if name in Robot.names: return self.rand_name()
        else: Robot.names.add(name)
        return name

    def reset(self):
        self.name = self.rand_name()
        return self.name

