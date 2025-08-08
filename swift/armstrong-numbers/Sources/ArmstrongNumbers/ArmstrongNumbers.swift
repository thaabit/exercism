import Foundation

func isArmstrongNumber(_ number: Int) -> Bool {
    let str = String(number)
    let cnt = str.count
    let chars = Array(str)
    var total = 0
    for c in chars {
        total += Int(pow(Double(String(c))!, Double(cnt)))
    }
    return total == number
}
