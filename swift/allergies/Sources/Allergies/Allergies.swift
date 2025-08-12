extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}

class Allergies {
  var foods = ["eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"]
  var total:Int
  init(_ total:Int) {
    self.total = total
  }
  func allergicTo(item:String) -> Bool {
    let bin = String(String(self.total, radix: 2).reversed())
    let idx = Int(foods.firstIndex(of:item)!)
    return idx >= bin.count ? false : bin[idx] == "1"
  }
  func list() -> [String] {
    var out:[String] = []
    for f in foods {
        if allergicTo(item:f) {
            out.append(f)
        }
    }
    return out
  }
}
