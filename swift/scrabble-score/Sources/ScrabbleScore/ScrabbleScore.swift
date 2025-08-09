func score(_ phrase: String) -> Int {
  var score = 0
  for l in Array(phrase) {
    switch l.uppercased() {
        case "A", "E", "I", "O", "U", "L", "N", "R", "S", "T" : score += 1
        case "D", "G"                                         : score += 2
        case "B", "C", "M", "P"                               : score += 3
        case "F", "H", "V", "W", "Y"                          : score += 4
        case "K"                                              : score += 5
        case "J", "X"                                         : score += 8
        case "Q", "Z"                                         : score += 10
        default                                               : score += 0
    }
  }
  return score
}
