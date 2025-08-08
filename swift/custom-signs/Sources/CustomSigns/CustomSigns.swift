let birthday = "Birthday"
let valentine = "Valentine's Day"
let anniversary = "Anniversary"
let space : Character = " "
let exclamation : Character = "!"

let BASE_COST = 20
let COST_PER_LETTER = 2

func buildSign(for occasion: String, name: String) -> String {
  "Happy \(occasion) \(name)!"
}

func graduationFor(name: String, year: Int) -> String {
  "Congratulations \(name)!\nClass of \(String(year))"
}

func costOf(sign: String) -> Int {
  BASE_COST + sign.count * COST_PER_LETTER
}
