let ordinals = ["","first","second","third","fourth","fifth","sixth","seventh","eighth","ninth","tenth","eleventh","twelfth"]
let gifts = [
    "",
    "a Partridge in a Pear Tree.",
    "two Turtle Doves",
    "three French Hens",
    "four Calling Birds",
    "five Gold Rings",
    "six Geese-a-Laying",
    "seven Swans-a-Swimming",
    "eight Maids-a-Milking",
    "nine Ladies Dancing",
    "ten Lords-a-Leaping",
    "eleven Pipers Piping",
    "twelve Drummers Drumming",
]

class TwelveDaysSong {
    static func recite(start:Int, end:Int) -> String {
        var verses = [String]()
        let partridge = gifts[1]
        for verse_idx in start...end {
            var verse = "On the \(ordinals[verse_idx]) day of Christmas my true love gave to me: "
            if verse_idx > 1 {
                verse += (2...verse_idx).reversed().map { gifts[$0] }.joined(separator:", ") + ", and "
            }
            verse += partridge
            verses.append(verse)
        }
        return verses.joined(separator:"\n")
    }
}
