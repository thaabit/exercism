class EmptyListException(Exception):
    """Exception raised when the linked list is empty.

    message: explanation of the error.

    """
    def __init__(self, message):
        self.message = message

class Iterator:
    def __init__(self, head):
        self.head_node = head

    def __next__(self):
        if not self.head_node: raise StopIteration
        val = self.head_node.value()
        self.head_node = self.head_node.next()
        return val

class Node:
    def __init__(self, value):
        self.val = value
        self.next_node = None

    def value(self):
        return self.val

    def next(self):
        return self.next_node

    def add_next(self, node):
        self.next_node = node


class LinkedList:
    def __init__(self, values=[]):
        values = list(values)
        self.head_node = None
        self.length = 0
        if len(values):
            self.head_node = Node(values.pop(0))
            self.length = 1
            for v in values:
                self.push(v)

    def __len__(self):
        return self.length

    def __iter__(self):
        return Iterator(self.head_node)

    def head(self):
        if not self.head_node: raise EmptyListException("The list is empty.")
        return self.head_node

    def push(self, value):
        node = Node(value)
        if self.head_node:
            node.add_next(self.head_node)
        self.head_node = node
        self.length += 1

    def pop(self):
        node = self.head()
        self.head_node = node.next()
        self.length -= 1
        return node.value()

    def reversed(self):
        new = LinkedList()
        while len(self) > 0:
            new.push(self.pop())
        self = new
        return self
