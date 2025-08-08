func newScoreBoard() -> [String: Int] {
  let scores : [String: Int] = [:]
  return scores
}

func addPlayer(_ scores: inout [String: Int], _ name: String, _ score: Int = 0) {
  scores[name] = score
}

func removePlayer(_ scores: inout [String: Int], _ name: String) {
  scores[name] = nil
}

func resetScore(_ scores: inout [String: Int], _ name: String) {
    if scores.index(forKey: name) != nil {
        scores[name] = 0
    }
}

func updateScore(_ scores: inout [String: Int], _ name: String, _ delta: Int) {
    if scores.index(forKey: name) != nil {
        if var score = scores[name] {
            score += delta
            scores[name] = score
        } else {
            print(name, delta)
            scores[name] = delta
        }
    }
}

func orderByPlayers(_ scores: [String: Int]) -> [(String, Int)] {
  var out : [(String, Int)] = []
  for (name, score) in scores.sorted(by: <) {
    out.append((name, score))
  }
  print(out)
  return out
}

func orderByScores(_ scores: [String: Int]) -> [(String, Int)] {
  var out : [(String, Int)] = []
  for (name, score) in scores.sorted(by: { $0.value > $1.value }) {
    out.append((name, score))
  }
  return out
}
