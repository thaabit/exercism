func sieve(limit: Int) -> [Int] {
  guard limit >= 2 else { return [] }
  var arr = Array(2...limit)
  var out : [Int] = []
  for idx in 0..<arr.count {
    let val = arr[idx]
    guard val != -1 else { continue }
    out.append(val)
    for idx2 in stride(from:idx, to:arr.count, by:val) {
        arr[idx2] = -1
    }
  }
  return out
}
