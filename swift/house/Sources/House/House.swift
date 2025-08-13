import Foundation

class House {
  static let phrases = [
    "the house that Jack built.",
    "the malt that lay in",
    "the rat that ate",
    "the cat that killed",
    "the dog that worried",
    "the cow with the crumpled horn that tossed",
    "the maiden all forlorn that milked",
    "the man all tattered and torn that kissed",
    "the priest all shaven and shorn that married",
    "the rooster that crowed in the morn that woke",
    "the farmer sowing his corn that kept",
    "the horse and the hound and the horn that belonged to",
  ]
  static func recite(start: Int, end: Int) -> String {
    var verses = [String]()
    for x in start...end {
        var verse = "This is " + phrases[x-1]
        for y in stride(from:x-1,to:0,by:-1) {
            verse += " " + phrases[y-1]
        }
        verses.append(verse)
    }
    return verses.joined(separator: "\n")
  }
}
