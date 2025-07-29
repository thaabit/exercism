class CustomSet:
    def __init__(self, elements=None):
        if not elements: elements = []
        self.set = set()
        for e in elements:
            self.add(e)

    def __len__(self):
        return len(self.set)

    def isempty(self):
        return len(self.set) == 0

    def __contains__(self, element):
        return element in self.set

    def issubset(self, other):
        for o in self.set:
            if o not in other.set: return False
        return True

    def isdisjoint(self, other):
        if not other: return True
        for o in other.set:
            if o in self.set: return False
        return True

    def __eq__(self, other):
        if len(other) != len(self): return False
        for o in other.set:
            if o not in self.set: return False
        return True

    def add(self, element):
        if element not in self.set: self.set.add(element)

    def intersection(self, other):
        new_set = CustomSet()
        for e in self.set:
            if e in other.set: new_set.add(e)
        return new_set

    def __sub__(self, other):
        new_set = CustomSet()
        new_set += self
        for o in other.set:
            if o in new_set.set: new_set.set.remove(o)
        return new_set

    def __add__(self, other):
        new_set = CustomSet()
        for o in other.set: new_set.add(o)
        for o in self.set: new_set.add(o)
        return new_set
