import Foundation

func tripletsWithSum(_ sum: Int) -> [[Int]] {
  var out = [[Int]]()
  let half = sum / 3
  for a in 2...half {
      if a >= half - 1 { break }
      for b in a+1...half {
          if b >= half - 1 { break }
          for c in b+1...half {
              if a + b + c == sum && Int(pow(Double(a),2) + pow(Double(b),2)) == Int(pow(Double(c),2)) { out.append([a,b,c]) }
          }
      }
  }
  return out
}
