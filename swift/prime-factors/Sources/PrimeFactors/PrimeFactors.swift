import Foundation

func primeFactors(_ number: Int64) -> [Int64] {
  var num = number
  var factor: Int64 = 2
  var factors = [Int64]()
  while true {
    if num == 1 { break }
    if (!isPrime(factor)) {
        factor += 1
        continue
    }
    if num % factor == 0 {
        num = num / factor
        factors.append(factor)
        continue
    } else {
        factor += 1
    }
  }
  return factors
}

func isPrime(_ n: Int64) -> Bool {
    guard n >= 2 else { return false }
    guard n != 2 else { return true }
    guard n % 2 != 0 else { return false }
    return !stride(from: 3, through: Int64(sqrt(Double(n))), by: 2).contains { n % $0 == 0 }
}
