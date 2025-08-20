import Foundation
import Algorithms

enum PalindromeError:Error {
    case invalidRange
}
class PalindromeProducts {

    static func _factors(_ from:Int, _ to: Int) -> [(value: Int, factors: Set<[Int]>)] {
        var out =  [(value:Int, factors: Set<[Int]>)]()
        for combo in Array(from...to).combinations(ofCount: 2) {
            print(combo)
            let x = combo[0], y = combo[1]
            let str = String(x*y)
            if str == String(str.reversed()) {
                out.append((value:x*y, factors:Set(arrayLiteral: [x, y])))
            }
        }
        return out
    }

    static func largest(from: Int, to: Int) throws -> (value: Int?, factors: Set<[Int]>) {
        guard to >= from else { throw PalindromeError.invalidRange }
        return _factors(from,to).max(by:{ $0.value < $1.value }) ?? (value:nil, factors:Set())
    }

    static func smallest(from: Int, to: Int) throws -> (value: Int?, factors: Set<[Int]>) {
        guard to >= from else { throw PalindromeError.invalidRange }
        return _factors(from,to).max(by:{ $0.value > $1.value }) ?? (value:nil, factors:Set())
    }
}
print(try! PalindromeProducts.smallest(from: 1, to: 9))
