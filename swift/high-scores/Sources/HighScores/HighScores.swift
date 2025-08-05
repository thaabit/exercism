struct HighScores {
    var scores: [Int]
    var latest : Int { self.scores.last ?? 0 }
    var personalBest : Int { self.scores.max() ?? 0  }
    var topThree : [Int] { Array(self.scores.sorted().reversed().prefix(3)) }
}
