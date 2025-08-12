class BottleSong {
  var bottles: Int
  let nums = ["No","One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten"]
  init(bottles:Int) {
    self.bottles = bottles
  }
  func song(takedown:Int) -> [String] {
    var out:[String] = []
    for i in stride(from:bottles, to:bottles-takedown, by:-1) {
      for _ in 1...2 {
        out.append("\(nums[i]) green bottle\(i==1 ? "" : "s") hanging on the wall,")
      }
      out.append("And if one green bottle should accidentally fall,")
      out.append("There'll be \(nums[i-1].lowercased()) green bottle\(i-1==1 ? "" : "s") hanging on the wall.")
      out.append("")
    }
    out.removeLast()
    return out
  }
}
