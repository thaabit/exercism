def is_triangle(sides):
    a,b,c = sides
    return a > 0 and a + b >= c and b + c >= a and a + c >= b

def equilateral(sides):
    if not is_triangle(sides): return False
    a, b, c = sides
    return a == b == c


def isosceles(sides):
    if not is_triangle(sides): return False
    a, b, c = sides
    return a == b or b == c or a == c


def scalene(sides):
    if not is_triangle(sides): return False
    a, b, c = sides
    return a != b != c and a != c
