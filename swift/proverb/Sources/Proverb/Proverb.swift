class Proverb {
  var items : [String]
    init(_ items: [String]) {
    self.items = items
  }
  func recite() -> String {
    var out: [String] = []
    if items.count > 1 {
        var prev: String = ""
        for i in items {
            if prev == "" {
                prev = i
                continue
            }
            out.append("For want of a \(prev) the \(i) was lost.")
            prev = i
        }
    }
    if items.count > 0 {
        out.append("And all for the want of a \(items[0]).")
    }
    return out.joined(separator:"\n")
  }

}
