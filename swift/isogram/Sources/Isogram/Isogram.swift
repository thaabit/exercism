func isIsogram(_ string: String) -> Bool {
  var letters : Set<String> = []
  for c in Array(string) {
    let l = String(c).lowercased()
    guard l.wholeMatch(of: /^[a-z]$/) != nil else { continue }
    guard !letters.contains(l) else { return false }
    letters.insert(l)
  }
  return true
}
