func getCard(at index: Int, from stack: [Int]) -> Int {
  stack[index]
}

func setCard(at index: Int, in stack: [Int], to newCard: Int) -> [Int] {
  if index >= stack.count { return stack }
  var substack = stack
  substack[index] = newCard
  return substack
}

func insert(_ newCard: Int, atTopOf stack: [Int]) -> [Int] {
  var substack = stack
  substack.append(newCard)
  return substack
}

func removeCard(at index: Int, from stack: [Int]) -> [Int] {
  if index >= stack.count { return stack }
  var substack = stack
  substack.remove(at:index)
  return substack
}

func insert(_ newCard: Int, at index: Int, from stack: [Int]) -> [Int] {
  if index > stack.count { return stack }
  var substack = stack
  substack.insert(newCard, at:index)
  return substack
}

func checkSizeOfStack(_ stack: [Int], _ size: Int) -> Bool {
  stack.count == size
}
