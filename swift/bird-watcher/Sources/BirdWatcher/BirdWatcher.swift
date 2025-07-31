func totalBirdCount(_ birdsPerDay: [Int]) -> Int {
  birdsPerDay.reduce(0,+)
}

func birdsInWeek(_ birdsPerDay: [Int], weekNumber: Int) -> Int {
  let start = ((weekNumber - 1) * 7)
  return birdsPerDay[start..<(start + 7)].reduce(0,+)
}

func fixBirdCountLog(_ birdsPerDay: [Int]) -> [Int] {
    var newBirdsPerDay = birdsPerDay
    for i in stride(from:0, to:(birdsPerDay.count - 1), by:2) {
        newBirdsPerDay[i] += 1
    }
    return newBirdsPerDay
}
