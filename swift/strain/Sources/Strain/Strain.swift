extension Array {
  func keep(_ f:(Element) -> Bool) -> [Element] {
    var out:[Element] = []
    for e in self {
        if f(e) { out.append(e) }
    }
    return out
  }
  func discard(_ f:(Element) -> Bool) -> [Element] {
    var out:[Element] = []
    for e in self {
        if !f(e) { out.append(e) }
    }
    return out
  }
}

