class Cell:
    def __init__(self, initial_value):
        self._value = initial_value
        self._listeners = set()
        self._callbacks = set()

    @property
    def value(self): return self._value

    @value.setter
    def value(self, value):
        if self._value != value:
            self._value = value
            self.notify_listeners()

    def notify_listeners(self):
        for l in self._listeners: l.update()

    def add_listener(self, cell):
        self._listeners.add(cell)

class InputCell(Cell):

    def compute(self):
        return self._value

    def update(self):
        pass


class ComputeCell(Cell):
    def __init__(self, inputs, compute_function):
        self._inputs = inputs
        self._compute_function = compute_function
        for i in inputs: i.add_listener(self)
        super().__init__(self.compute())

    @property
    def value(self):
        return self._value

    def compute(self):
        return self._compute_function([x.value for x in self._inputs])

    def update(self):
        for i in self._inputs: i.update()
        computed = self.compute()
        if computed != self._value:
            self._value = computed
            for c in self._callbacks: c(self._value)
            self.notify_listeners()

    def add_callback(self, callback):
        self._callbacks.add(callback)

    def remove_callback(self, callback):
        self._callbacks.discard(callback)

