class Node:
    def __init__(self, value, left=None, right=None):
        self.value = value
        self.left = left
        self.right = right

class Zipper:
    @staticmethod
    def from_tree(tree):
        left = Zipper.from_tree(tree["left"]) if tree["left"] else None
        right = Zipper.from_tree(tree["right"]) if tree["right"] else None
        root = Node(tree["value"], left, right)
        return Zipper(root)

    def __init__(self, focus):
        self.focus = focus

    def value(self):
        return self.focus.value

    def set_value(self, value):
        self.value = value

    def left(self):
        return self.focus.left

    def set_left(self, tree):
        self.focus.left = Zipper.from_tree(tree)

    def right(self):
        return self.focus.right

    def set_right(self):
        self.focus.right = Zipper.from_tree(tree)

    def up(self):
        pass

    def to_tree(self):
        if not self: return None
        left = self.left().to_tree() if self.left() else None
        right = self.right().to_tree() if self.right() else None
        d = {
            "value": self.value(),
            "left": left,
            "right": right,
        }
