func toLimit(_ limit: Int, inMultiples: [Int]) -> Int {
  var multiples = Set<Int>()
  for m in inMultiples {
    if m <= limit && m != 0 {
        for i in stride(from:m, to:limit, by:m) {
            multiples.insert(i)
        }
    }
  }
  return multiples.reduce(0,+)
}
