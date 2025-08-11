class Triangle<T:Numeric & Comparable> {
  var a:T
  var b:T
  var c:T

  init(_ sides:[T]) {
    a = sides[0]
    b = sides[1]
    c = sides[2]
  }
  var isTriangle: Bool {
    a > 0 && b > 0 && c > 0 && (a + b >= c) && (b + c >= a) && (a + c >= b)
  }
  var isEquilateral: Bool {
    self.isTriangle && a == b && b == c
  }
  var isIsosceles: Bool {
    self.isTriangle && (a == b || b == c || a == c)
  }
  var isScalene: Bool {
    return self.isTriangle && (a != b && b != c && a != c)
  }
}
