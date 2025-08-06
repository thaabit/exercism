import Foundation

struct Clock: Equatable {
  var hrs:Int
  var mins:Int

  init(hours: Int, minutes: Int) {
    hrs = hours
    mins = minutes
  }

  func description:String = {
    String(format: "%02d:%02d", hrs, mins)
  }()

}
print(Clock(hours: 24, minutes: 30).description)
