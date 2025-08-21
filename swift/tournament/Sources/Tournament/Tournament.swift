
import Foundation
class Tournament {
    struct Team {
        var wins:Int = 0
        var draws:Int = 0
        var losses:Int = 0
        var name:String = ""
        var matches:Int { wins + draws + losses }
        var points:Int { wins * 3 + draws * 1 }
    }
    var teams = [String:Team]()
    init(){}
    func addMatch(_ match:String) {
        let parts = match.components(separatedBy:";")
        let nameA = parts[0], nameB = parts[1], result = parts[2]
        var teamA = teams[nameA] ?? Team(name:nameA)
        var teamB = teams[nameB] ?? Team(name:nameB)
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
        print(teamA.points)
        teams[nameA] = teamA
        teams[nameB] = teamB
        print(teams)
    }
}
Tournament().addMatch("Allegoric Alaskans;Blithering Badgers;win")
Tournament().addMatch("Allegoric Alaskans;Blithering Badgers;win")
