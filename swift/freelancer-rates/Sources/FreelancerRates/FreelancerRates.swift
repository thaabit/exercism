let DAILY_HOURS = 8.0
let MONTHLY_DAYS = 22.0

func dailyRateFrom(hourlyRate: Int) -> Double {
  Double(hourlyRate) * DAILY_HOURS
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
  (Double(hourlyRate) * (1 - discount/100) * DAILY_HOURS * MONTHLY_DAYS).rounded(.up)
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
  (budget / (Double(hourlyRate) * (1 - discount/100) * DAILY_HOURS)).rounded(.down)
}
