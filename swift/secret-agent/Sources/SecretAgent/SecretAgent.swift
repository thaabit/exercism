func protectSecret(_ secret: String, withPassword password: String) -> (String) -> String {
  func protector (_ attempt: String) -> String {
    attempt == password ? secret : "Sorry. No hidden secrets here."
  }
  return protector
}

func generateCombination(forRoom room: Int, usingFunction f: (Int) -> Int) -> (Int, Int, Int) {
  let first = f(room)
  let second = f(first)
  let third = f(second)
  return (first, second, third)
}
