enum ClassificationError: Error {
    case invalidInput
}
enum Classification {
  case perfect
  case abundant
  case deficient
}

func classify(number: Int) throws -> Classification {
  guard number > 0 else { throw ClassificationError.invalidInput }
  var factors : [Int] = []
  if number > 1 {
    for i in 1...(number/2) {
        if number % i == 0 { factors.append(i) }
    }
  }
  let sum = factors.reduce(0, +)
  return sum == number ? Classification.perfect :
         sum <  number ? Classification.deficient :
                         Classification.abundant
}
