import Foundation

enum NumberSeriesError:Error {
    case spanLongerThanInput, invalidCharacter, spanIsZeroOrNegative
}

class NumberSeries {
  var number:String
  init(_ num:String) throws {
    guard num.wholeMatch(of: #/^\d*$/#) != nil else { throw NumberSeriesError.invalidCharacter }
    number = num
  }
  func largestProduct(_ len:Int) throws -> Int {
    guard len > 0 else { throw NumberSeriesError.spanIsZeroOrNegative }
    guard len <= number.count else { throw NumberSeriesError.spanLongerThanInput }
    let numArray:[Int] = Array(number).map { Int(String($0))! }
    var totals = [Int]()
    for i in 0...(number.count - len) {
        let total = Int(numArray[i...i+len-1].reduce(1,*))
        totals.append(total)
    }
    return totals.max()!

  }
}
