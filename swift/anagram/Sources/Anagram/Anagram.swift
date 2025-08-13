class Anagram {
  var word: String
  init(word:String) {
    self.word = word.lowercased()
  }
  func letterCounts(_ word:String) -> [Character:Int] {
    var out:[Character:Int] = [:]
    for l in Array(word) {
        out[l] = out[l] != nil ? out[l]! + 1 : 1
    }
    return out
  }

  func isAnagram(_ a:String,_ b:String) -> Bool {
    let a = a.lowercased(), b = b.lowercased()
    guard a != b else { return false }
    guard a.count == b.count else { return false }
    let countsA = letterCounts(a), countsB = letterCounts(b)
    var isAnagram = true
    for (l,c) in countsA {
        if c != countsB[l] ?? 0 {
            isAnagram = false
            break
        }
    }
    return isAnagram;
  }

  func match(_ words:[String]) -> [String] {
    var out:[String] = []
    for w in words {
        if isAnagram(w, self.word) { out.append(w) }
    }
    return out
  }
}
