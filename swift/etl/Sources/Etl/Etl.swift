class ETL {
  static func transform(_ old: [String: [String]]) -> [String: Int] {
    var out:[String: Int] = [:]
    for (score, letters) in old {
        for l in letters {
            out[l.lowercased()] = Int(score)
        }
    }
    return out
  }
}
