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
        for i in start...end {
            var list = [String]()
            for i2 in (1...i).reversed() {
                list.append(gifts[i2])
            }
            var verse = "On the \(ordinals[start]) day of Christmas my true love gave to me: "
            if list.count > 0 {
                verse += list.joined(separator:", ") + ", and a "
            }
            verse += partridge
            verses.append(verse)
        }
        return verses.joined(separator:"\n")
    }
}
print(TwelveDaysSong.recite(start: 1, end: 1))
