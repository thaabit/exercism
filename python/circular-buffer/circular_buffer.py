class BufferFullException(BufferError):
    """Exception raised when CircularBuffer is full.

    message: explanation of the error.

    """
    def __init__(self, message):
        self.message = message


class BufferEmptyException(BufferError):
    """Exception raised when CircularBuffer is empty.

    message: explanation of the error.

    """
    def __init__(self, message):
        self.message = message


class CircularBuffer:
    def __init__(self, capacity):
        self.capacity = capacity
        self.stack = []

    def read(self):
        if not len(self.stack): raise BufferEmptyException("Circular buffer is empty")
        return self.stack.pop(0)

    def write(self, data):
        if len(self.stack) == self.capacity: raise BufferFullException("Circular buffer is full")
        self.stack.append(data)

    def overwrite(self, data):
        for i, d in enumerate(*data):
            if len(self.stack) == self.capacity: self.stack.pop(0)
            self.stack.append(d)

    def clear(self):
        self.stack = []
