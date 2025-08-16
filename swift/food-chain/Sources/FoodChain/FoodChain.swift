let animals = ["","fly","spider","bird","cat","dog","goat","cow","horse"]
let extra = [
    "",
    "I don't know why she swallowed the fly. Perhaps she'll die.",
    "It wriggled and jiggled and tickled inside her.",
    "How absurd to swallow a bird!",
    "Imagine that, to swallow a cat!",
    "What a hog, to swallow a dog!",
    "Just opened her throat and swallowed a goat!",
    "I don't know how she swallowed a cow!",
    "She's dead, of course!",
]

struct FoodChain {
    static func song(start: Int, end: Int) -> String {
        var out:[String] = []
        for i in start...end {
            let animal = animals[i]
            var verse:[String] = [
                "I know an old lady who swallowed a \(animal).",
                extra[i],
            ]
            if animal != "horse" {
                for j in stride(from:i, to:1, by:-1) {
                    var line = "She swallowed the \(animals[j]) to catch the \(animals[j-1])"
                    line += animals[j-1] == "spider" ? " that wriggled and jiggled and tickled inside her." : "."
                    verse.append(line)
                }
                if animal != "fly" {
                    verse.append(extra[1])
                }
            }
            out.append(verse.joined(separator:"\n"))
        }
        return out.joined(separator:"\n\n")
    }
}
