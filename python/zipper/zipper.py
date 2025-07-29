class Zipper:
    @staticmethod
    def from_tree(tree, parent=None):
        z = Zipper(tree["value"], parent)
        z.set_left(tree["left"])
        z.set_right(tree["right"])
        return z

    def __init__(self, value, parent=None):
        self._value = value
        self.parent = parent
        self._left = None
        self._right = None

    def value(self):
        return self._value

    def set_value(self, value):
        self._value = value
        return self

    def left(self):
        return self._left

    def set_left(self, tree):
        if not tree or isinstance(tree, Zipper):
            self._left = tree
        else:
            self._left = Zipper.from_tree(tree, self)
        return self

    def right(self):
        return self._right

    def set_right(self, tree):
        if not tree or isinstance(tree, Zipper):
            self._right = tree
        else:
            self._right = Zipper.from_tree(tree, self)
        return self

    def up(self):
        return self.parent

    def to_tree(self):
        while self.up(): self = self.up()
        return self._to_tree()

    def _to_tree(self):
        left = self._left._to_tree() if self._left else None
        right = self._right._to_tree() if self._right else None
        d = {
            "value": self.value(),
            "left": left,
            "right": right,
        }
        return d
