import operator
ops = {
    '+' : operator.add,
    '-' : operator.sub,
    '*' : operator.mul,
    '/' : operator.truediv,
}
import re
class StackUnderflowError(Exception):
    """Exception raised when Stack is not full.
       message: explanation of the error.
    """
    def __init__(self, message):
        self.message = message


def evaluate(input_data, stack=None, defs=None):
    if not stack: stack = list()
    if not defs: defs = {}
    _def = None
    for i in input_data:
        in_def = False
        for w in i.split(" "):
            if w == ':':
                in_def = True
            elif w == ';':
                defs[_def[0]] = _def[1:]
                _def = None
                in_def = False
            elif in_def:
                if not _def:
                    if re.match(r"^-?\d+$", w): raise ValueError("illegal operation")
                    _def = [w.lower()]
                else:
                    if w.lower() in defs:
                        _def.extend(defs[w.lower()])
                    else:
                        _def.append(w)
            elif re.match(r"^-?\d+$", w):
                stack.append(int(w))
            elif w.lower() in defs:
                stack = evaluate([" ".join(defs[w.lower()])], stack, defs)
            elif w in ops.keys():
                if len(stack) < 2: raise StackUnderflowError("Insufficient number of items in stack")
                if w == '/' and stack[-1] == 0: raise ZeroDivisionError("divide by zero")
                stack.append(int(ops[w](stack.pop(-2), stack.pop())))
            elif w.lower() == 'dup':
                if len(stack) < 1: raise StackUnderflowError("Insufficient number of items in stack")
                stack.append(stack[-1])
            elif w.lower() == 'swap':
                if len(stack) < 2: raise StackUnderflowError("Insufficient number of items in stack")
                stack.append(stack.pop(-2))
            elif w.lower() == 'over':
                if len(stack) < 2: raise StackUnderflowError("Insufficient number of items in stack")
                stack.append(stack[-2])
            elif w.lower() == 'drop':
                if len(stack) < 1: raise StackUnderflowError("Insufficient number of items in stack")
                stack.pop()
            else: raise ValueError("undefined operation")
    return stack
