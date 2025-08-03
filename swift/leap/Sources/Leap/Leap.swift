class Year {
    var year : Int
    init (calendarYear: Int) {
        self.year = calendarYear
    }
    lazy var isLeapYear : Bool = {
        let y = self.year
        return y % 4 == 0 && (!(y % 100 == 0) || y % 400 == 0)
    }()
}
