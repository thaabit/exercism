import Foundation

struct Team {
    var wins:Int = 0
    var draws:Int = 0
    var losses:Int = 0
    var name:String = ""
    var matches:Int { wins + draws + losses }
    var points:Int { wins * 3 + draws * 1 }
}

class Tournament {
    var teams: [String:Team]
    init(){ self.teams = [:] }
    func addMatch(_ match:String) {
        let parts = match.components(separatedBy:";")
        let nameA = parts[0], nameB = parts[1], result = parts[2]
        var teamA = teams[nameA, default: Team(name:nameA)]
        var teamB = teams[nameB, default: Team(name:nameB)]
        if result == "loss" {
            teamA.losses += 1
            teamB.wins += 1
        } else if result == "draw" {
            teamA.draws += 1
            teamB.draws += 1
        } else {
            teamA.wins += 1
            teamB.losses += 1
        }
        teams[nameA] = teamA
        teams[nameB] = teamB
    }

    func paddedTeam(_ team:String) -> String {
        team.padding(toLength:30, withPad:" ", startingAt:0)
    }

    func pointsThenName(_ lhs: (String,Team), _ rhs: (String, Team)) -> Bool {
        if lhs.1.points != rhs.1.points {
            return lhs.1.points > rhs.1.points
        }
        return lhs.0 < rhs.0
    }

    func tally() -> [String] {
        var out = [paddedTeam("Team") + " | MP |  W |  D |  L |  P"]
        for (name, t) in teams.sorted(by: pointsThenName) {
            let name = paddedTeam(name)
            let stats = String(format:" | % 2d | % 2d | % 2d | % 2d | %2d", t.matches, t.wins, t.draws, t.losses, t.points)
            out.append(name + stats)
        }

        return out
    }
}
