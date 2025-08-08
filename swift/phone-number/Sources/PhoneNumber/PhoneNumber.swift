import Foundation

enum PhoneNumberError : Error {
    case invalidPhoneNumber
}

extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}

class PhoneNumber {
  var num: String

  init(_ num: String) {
    self.num = num
  }

  func clean() throws -> String {
    var out = self.num.replacingOccurrences(of:"\\D", with:"", options: [.regularExpression])
    out = String(out.trimmingPrefix("1"))

    guard out.count == 10 else { throw PhoneNumberError.invalidPhoneNumber }
    guard Int(out[0]) != 0 && Int(out[0]) != 1 else { throw PhoneNumberError.invalidPhoneNumber }
    guard Int(out[3]) != 0 && Int(out[3]) != 1 else { throw PhoneNumberError.invalidPhoneNumber }

    return String(out)
  }
}
