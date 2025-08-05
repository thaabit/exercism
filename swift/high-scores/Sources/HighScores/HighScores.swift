import Foundation

struct HighScores {
    var scores: [Int]
    var size: Int
    init(scores: [Int]) {
        self.scores = scores
        self.size = scores.count
    }

    lazy var latest = { self.scores.last! }()
    lazy var personalBest = { self.scores.max() ?? 0  }()
    lazy var topThree = { Array(self.scores.sorted().reversed()[0..<(self.size >= 3 ? 3 : self.size)]) }()
}
