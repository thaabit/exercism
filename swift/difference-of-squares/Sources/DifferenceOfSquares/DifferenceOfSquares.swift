class Squares {
    var num: Int

    init(_ num: Int) {
        self.num = num
    }

    lazy var squareOfSum: Int = {
        let sum = (1...(self.num)).reduce(0, +)
        return sum * sum
    }()

    lazy var sumOfSquares: Int = {
        var total = 0
        for i in 1...self.num {
            total += i*i
        }
        return total
    }()

    lazy var differenceOfSquares: Int = {
        self.squareOfSum - self.sumOfSquares
    }()
}
