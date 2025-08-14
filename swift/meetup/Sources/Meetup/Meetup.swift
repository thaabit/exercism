import Foundation

extension Date {
    func weekday() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
}
let days = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]

class Meetup {
  init(year:Int, month:Int, week:String, weekday:String) {
    var components = DateComponents()
    components.year = year
    components.month = month
    let calendar = Calendar.current

    if week == "teenth" {
        components.day = 13
        if let teenth = calendar.date(from: components) {
            print(teenth.weekday())
        }
    }
  }
}
Meetup(year: 2013, month: 8, week: "teenth", weekday: "Monday")
