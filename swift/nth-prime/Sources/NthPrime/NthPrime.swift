enum PrimeError:Error {
    case noZerothPrime
}
func nthPrime(_ n: Int) throws -> Int {
    guard n > 0 else { throw PrimeError.noZerothPrime }
    if n == 1 { return 2 }
    var next = 1
    for _ in 2...n {
        while true {
            next += 2
            if next == 3  { break }
            var isPrime = true
            for i in stride(from:3, to:Int(Double(next).squareRoot())+1, by:2) {
                if next % i == 0 { isPrime = false; break  }
            }
            if isPrime { break }
        }
    }
    return next
}
