import Foundation

extension Date {
    func weekday() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
}
let days = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
let weeks = ["first","second","third","fourth","last"]

class Meetup {
    var description:String = ""

    init(year:Int, month:Int, week:String, weekday:String) {
        var components = DateComponents()
        components.year = year
        components.month = month
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        if week == "teenth" {
            for day in 13...19 {
                components.day = day
                if let teenth = calendar.date(from: components) {
                    if teenth.weekday() == weekday {
                        self.description = formatter.string(from:teenth)
                    }
                }
            }
        } else {
            components.day = 1
            if let firstDayOfMonth = calendar.date(from: components) {
                let diff = (Int(days.firstIndex(of:weekday)! - days.firstIndex(of:firstDayOfMonth.weekday()!)!) + 7) % 7
                components.day = 1 + diff + (7 * Int(weeks.firstIndex(of:week)!))
                if let actualDay = calendar.date(from: components) {
                    let f2 = DateFormatter()
                    f2.dateFormat = "M"
                    if Int(f2.string(from:actualDay))! != month {
                        components.day! -= 7
                        if let weekEarlier = calendar.date(from: components) {
                            self.description = formatter.string(from:weekEarlier)
                        }
                    } else {
                        self.description = formatter.string(from:actualDay)
                    }
                }
            }
        }
    }
}
