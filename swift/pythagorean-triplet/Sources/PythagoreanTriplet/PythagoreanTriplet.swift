import Foundation

func tripletsWithSum(_ sum: Int) -> [[Int]] {
  var out = [[Int]]()
  let half = sum / 2
  for a in 2...half {
      if a >= half - 1 { break }
      for b in a+1...half {
        let c = sum - a - b
        if a + b + c == sum && a * a + b * b == c * c { out.append([a,b,c]) }
      }
  }
  return out
}
