class InputCell:
    def __init__(self, initial_value):
        self.value = initial_value


class ComputeCell:
    def __init__(self, inputs, compute_function):
        args = [x.value for x in inputs]
        self.value = compute_function(args)

    def add_callback(self, callback):
        self.value.bind_to(callback)

    def remove_callback(self, callback):
        self.callback = None
