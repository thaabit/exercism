class Iterator:
    def __init__(self, head):
        self.head_node = head

    def __next__(self):
        if not self.head_node: raise StopIteration
        node = self.head_node
        self.head_node = self.head_node.previous
        return node

class Node:
    def __init__(self, value, succeeding=None, previous=None):
        self.value = value
        self.succeeding = succeeding
        self.previous = previous

class LinkedList:
    def __init__(self):
        self.head = None
        self.tail = None
        self.length = 0

    def __len__(self):
        return self.length

    def __iter__(self):
        return Iterator(self.head)

    def unshift(self, value):
        succeeding = self.tail if self.tail else None
        node = Node(value=value, succeeding=succeeding)
        if self.tail: self.tail.previous = node
        self.tail = node
        if not self.head: self.head = node
        self.length += 1

    def shift(self):
        if not self.tail: raise IndexError("List is empty")
        val = self.tail.value
        self.tail = self.tail.succeeding
        if self.tail: self.tail.previous = None
        self.length -= 1
        if self.length == 0:
            self.tail = None
            self.head = None
        return val

    def push(self, value):
        prev = self.head if self.head else None
        node = Node(value=value, previous=prev)
        if self.head: self.head.succeeding = node
        self.head = node
        if not self.tail: self.tail = node
        self.length += 1

    def pop(self):
        if not self.head: raise IndexError("List is empty")
        if self.head.previous: self.head.previous.succeeding = None
        val = self.head.value
        self.head = self.head.previous
        self.length -= 1
        if self.length == 0:
            self.tail = None
            self.head = None
        return val

    def delete(self, value):
       for node in self:
           if node.value == value:
               if node == self.tail: self.tail = node.succeeding
               if node == self.head: self.head = node.previous
               if node.previous: node.previous.succeeding = node.succeeding
               if node.succeeding: node.succeeding.previous = node.previous
               self.length -= 1
               return
       raise ValueError("Value not found")
