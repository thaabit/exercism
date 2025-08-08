func timeToPrepare(drinks: [String]) -> Double {
    time = 0.0
    for drink in drinks {
        switch drink {
            case "beer", "soda", "water": time += 0.5
            case "shot":                  time += 1.0
            case "mixed drink":           time += 1.5
            case "fancy drink":           time += 2.5
            case "frozen drink":          time += 3.0
        }
    }
    return time
}

func makeWedges(needed: Int, limes: [String]) -> Int {
    total = 0
    count = 0
    for lime in limes {
        count += 1
        switch lime {
            case "small" : total += 6
            case "medium": total += 8
            case "large" : total += 10
        }
        if total >= needed { break }
    }
    return count
}

func finishShift(minutesLeft: Int, remainingOrders: [[String]]) -> [[String]] {
    var remainingOrders = remainingOrders
    for order in remainingOrders {
        time = timeToPrepare(order)
        if time > minutesLeft { break }
        minutesLeft -= time
        remainingOrders.remove(at:0)
    }
    return remainingOrders
}

func orderTracker(orders: [(drink: String, time: String)]) -> (
  beer: (first: String, last: String, total: Int)?, soda: (first: String, last: String, total: Int)?
) {
  var firstBeer: String?, lastBeer: String?, totalBeer: Int?
  var firstSoda: String?, lastSoda: String?, totalSoda: Int?
  for order in orders {
    switch order.drink {
        case "beer":


  }
  return (beer: (first: firstBeer, last: lastBeer, total: totalBeer), soda: (first: firstSoda, last: lastSoda, total: totalSoda))
}
