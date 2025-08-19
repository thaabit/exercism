import Foundation

enum BowlingError:Error {
    case negativePins, tooManyPinsInFrame, gameIsOver, gameInProgress
}
class Bowling {
    var rolls:[Int]

    init(_ rolls:[Int]) {
        self.rolls = rolls
    }

    func frames() throws -> [Int] {
        var frames = [Int](), skip = false
        let ri = rolls.indices
        for (i, count) in rolls.enumerated() {

            if skip { skip = false; continue }

            if frames.count < 10 {
                guard ri.contains(i+1) else { frames.append(-1); break }
                let strike = count == 10, next = rolls[i+1], spare = !strike && count + next == 10
                if strike || spare {
                    guard ri.contains(i+2) else { frames.append(-1); break }
                    frames.append(count + next + rolls[i+2])
                    if spare { skip = true }
                } else {
                    let score = count + rolls[i+1]
                    guard score <= 10 else { throw BowlingError.tooManyPinsInFrame }
                    frames.append(score)
                    skip = true
                }
            }
        }
        return frames
    }

    func roll(pins: Int) throws {
        guard pins >= 0       else { throw BowlingError.negativePins }
        guard pins <= 10      else { throw BowlingError.tooManyPinsInFrame }
        guard try !gameOver() else { throw BowlingError.gameIsOver }
        guard try frames().last == -1 && pins + rolls.last! <= 10 else { throw BowlingError.tooManyPinsInFrame }

        rolls.append(pins)
    }

    func gameOver() throws -> Bool {
        let f = try frames()
        return f.count == 10 && f.count > 0 && f.last != -1
    }

    func score() throws -> Int {
        guard try gameOver() else { throw BowlingError.gameInProgress }
        return try frames().reduce(0, +)
    }
}
