import Foundation

struct Clock: Equatable {
  var hrs:Int
  var mins:Int
  let minsInDay = 60 * 24

  init(hours: Int, minutes: Int) {
    let totalMins = ((hours * 60 + minutes) % minsInDay + minsInDay) % minsInDay
    hrs = totalMins / 60
    mins = totalMins % 60
  }

  func add(minutes: Int) -> Clock {
    Clock(hours: hrs, minutes: mins + minutes)
  }

  func subtract(minutes: Int) -> Clock {
    Clock(hours: hrs, minutes: mins - minutes)
  }

  var description:String {
    String(format: "%02d:%02d", hrs, mins)
  }

}
