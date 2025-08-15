enum SayError:Error {
    case outOfRange
}
let ordinals = ["zero","one","two","three","four","five","six","seven","eight","nine"]
let teens = ["ten","eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"]
let tens = ["zero","ten","twenty","thirty","forty","fifty","sixty","seventy","eighty","ninety"]
let orders = Array(["hundred","thousand","million","billion"].reversed())

func say(number: Int) throws -> String {
    if number > 999999999999 || number < 0 { throw SayError.outOfRange }
    if number == 0 { return "zero" }
    var out = [String]()
    var num = number
    for (i, order) in [1_000_000_000, 1_000_000, 1000, 100].enumerated() {
        var howMany = num / order
        var overHundred = false
        if howMany > 100 {
            let hundreds = howMany / 100
            out.append("\(upTo100(hundreds)) hundred")
            howMany -= hundreds * 100
            num -= hundreds * 100 * order
            overHundred = true
        }
        if howMany > 0 {
            out.append("\(upTo100(howMany)) \(orders[i])")
        } else if overHundred {
            out.append("\(orders[i])")
        }
        num -= howMany * order
    }
    let ones = upTo100(num)
    if ones != "zero" {
        out.append(ones)
    }

    return out.joined(separator:" ")
}

func upTo100(_ number:Int) -> String {
    if number == 0 { return "zero" }
    var out = ""
    var num = number
    var hasTens = false
    if num >= 20 {
        let howMany = num / 10
        out += tens[howMany]
        num -= 10 * howMany
        hasTens = true
    }
    if num > 10 {
       out += teens[num - 10]
       num = 0
    }
    if num > 0 {
        if hasTens { out += "-" }
        out += ordinals[num]
    }

    return out
}
