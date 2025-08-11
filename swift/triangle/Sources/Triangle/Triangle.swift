class Triangle<T> {
  var sides:[T]
  init(_ sides:[T]) {
    self.sides = sides
  }
  func isEquilateral() -> Bool {
    return sides[0] == sides[1] && sides[1] == sides[2]
  }
  func isIsosceles() -> Bool {
    return sides[0] == sides[1] || sides[1] == sides[2] || sides[0] == sides[2]
  }
  func isScalene() -> Bool {
    return !isIsosceles()
  }
}
