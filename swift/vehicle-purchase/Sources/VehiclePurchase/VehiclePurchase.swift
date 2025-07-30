let MONTHS : Double = 12 * 5
func canIBuy(vehicle: String, price: Double, monthlyBudget: Double) -> String {
  let monthly_cost = price / MONTHS
  if monthly_cost <= monthlyBudget {
    return "Yes! I'm getting a \(vehicle)"
  } else if monthly_cost <= monthlyBudget * 1.1 {
    return "I'll have to be frugal if I want a \(vehicle)"
  } else {
    return "Darn! No \(vehicle) for me"
  }
}

func licenseType(numberOfWheels wheels: Int) -> String {
  if wheels == 2 || wheels == 3 {
    return "You will need a motorcycle license for your vehicle"
  } else if wheels == 4 || wheels == 6 {
    return "You will need an automobile license for your vehicle"
  } else if wheels == 18 {
    return "You will need a commercial trucking license for your vehicle"
  } else {
    return "We do not issue licenses for those types of vehicles"
  }
}

func calculateResellPrice(originalPrice: Int, yearsOld: Int) -> Int {
    let percent = yearsOld < 3 ? 0.8 : yearsOld < 10 ? 0.7 : 0.5
    return Int(Double(originalPrice) * percent)
}
