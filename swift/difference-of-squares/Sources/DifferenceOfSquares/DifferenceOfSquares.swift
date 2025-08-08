class Squares {
    var num: Int
    var sumOfSquares: Int = 0
    var squareOfSum: Int = 0
    var differenceOfSquares: Int = 0

    init(_ num: Int) {
        self.num = num
        sumOfSquares = self._sumOfSquares()
        squareOfSum = self._squareOfSum()
        differenceOfSquares = squareOfSum - sumOfSquares
    }

    func _squareOfSum() -> Int {
        let sum = (1...(self.num)).reduce(0, +)
        return sum * sum
    }

    func _sumOfSquares() -> Int {
        var total = 0
        for i in 1...self.num {
            total += i*i
        }
        return total
    }
}
