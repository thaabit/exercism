enum PalindromeError:Error {
    case invalidRange
}
extension Int {
    func isPalindrome() -> Bool {
        let str = String(self)
        return str == String(str.reversed())
    }
}
class PalindromeProducts {

    static func largest(from: Int, to: Int) throws -> (value: Int?, factors: Set<[Int]>) {
        guard to >= from else { throw PalindromeError.invalidRange }
        var max:Int? = nil, factors: Set<[Int]> = []

        for x in stride(from:to, through:from, by:-1) {
            if let max=max, x*x < max { break }
            for y in stride(from:x, through:from, by:-1) {
                let product = x * y
                if product >= max ?? 0 && product.isPalindrome() {
                    if product > max ?? 0 {
                        max = product
                        factors = [[x,y].sorted()]
                    } else {
                        factors.insert([x,y].sorted())
                    }
                }
            }
        }
        return (value:max, factors:factors)
    }

    static func smallest(from: Int, to: Int) throws -> (value: Int?, factors: Set<[Int]>) {
        guard to >= from else { throw PalindromeError.invalidRange }
        var min:Int? = nil, factors: Set<[Int]> = []

        for x in from...to {
            if let min=min, x*x > min { break }
            for y in x...to {
                let product = x * y
                if (min == nil || product <= min!) && product.isPalindrome() {
                    if min == nil || product < min! {
                        min = product
                        factors = [[x,y].sorted()]
                    } else {
                        factors.insert([x,y].sorted())
                    }
                }
            }
        }
        return (value:min, factors:factors)
    }
}
