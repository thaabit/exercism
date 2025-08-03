import Foundation
func dartScore(x: Double, y: Double) -> Int {
  let d = (x*x + y*y).squareRoot()
  return d <= 1  ? 10
       : d <= 5  ? 5
       : d <= 10 ? 1
       :           0
}
