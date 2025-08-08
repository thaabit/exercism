func raindrops(_ number: Int) -> String {
  var out = ""
  if number % 3 == 0 { out += "Pling" }
  if number % 5 == 0 { out += "Plang" }
  if number % 7 == 0 { out += "Plong" }
  if out.count == 0  { out = "\(number)" }
  return out
}
