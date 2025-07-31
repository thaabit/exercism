func timeToPrepare(drinks: [String]) -> Double {
    var time = 0.0
    for drink in drinks {
        switch drink {
            case "beer", "soda", "water": time += 0.5
            case "shot":                  time += 1.0
            case "mixed drink":           time += 1.5
            case "fancy drink":           time += 2.5
            case "frozen drink":          time += 3.0
            default:                      time += 0.0
        }
    }
    return time
}

func makeWedges(needed: Int, limes: [String]) -> Int {
    var total = 0
    var count = 0
    var limes = limes
    while total < needed && !limes.isEmpty {
        var lime = limes.remove(at:0)
        count += 1
        switch lime {
            case "small" : total += 6
            case "medium": total += 8
            case "large" : total += 10
            default      : total += 0
        }
    }
    return count
}

func finishShift(minutesLeft: Int, remainingOrders: [[String]]) -> [[String]] {
    var remainingOrders = remainingOrders
    var minutesLeft = Double(minutesLeft)
    while !remainingOrders.isEmpty && (minutesLeft > 0) {
        var order = remainingOrders.remove(at:0)
        let time = timeToPrepare(drinks: order)
        minutesLeft -= time
    }
    return remainingOrders
}

func orderTracker(orders: [(drink: String, time: String)]) -> (
  beer: (first: String, last: String, total: Int)?, soda: (first: String, last: String, total: Int)?
) {
  var soda: (first: String, last: String, total: Int)? = nil
  var beer: (first: String, last: String, total: Int)? = nil
  for order in orders {
    if order.drink == "beer" {
        if let tmp = beer {
            beer = (first: tmp.first, last: order.time, total: (tmp.total + 1))
        }
        else {
            beer = (first: order.time, last: order.time, total: 1)
        }
    } else if order.drink == "soda" {
        if let tmp = soda {
            soda = (first: tmp.first, last: order.time, total: (tmp.total + 1))
        }
        else {
            soda = (first: order.time, last: order.time, total: 1)
        }
    }
  }
  return (beer, soda)
}
