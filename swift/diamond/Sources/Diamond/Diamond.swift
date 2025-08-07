class Diamond {
  static func makeDiamond(letter: Character) -> [String] {
    var out: [String] = []
    print(letter)
    let chars = "A"...letter
    print(array)
    let width = chars.count
    for (i, char) in chars.enumerated() {
        print(i, char)
    }
    return out
  }
}
print(Diamond.makeDiamond(letter: "B"))
