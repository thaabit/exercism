enum SeriesError:Error {
    case sliceLengthLongerThanSeries, sliceLengthZeroOrLess, emptySeries
}

class Series {
    var series:[String]

    init(_ series:String) {
        self.series = Array(series).map { String($0) }
    }

    func slice(_ len: Int) throws -> [String] {

        guard series.count > 0    else { throw SeriesError.emptySeries }
        guard len > 0             else { throw SeriesError.sliceLengthZeroOrLess }
        guard len <= series.count else { throw SeriesError.sliceLengthLongerThanSeries }

        var out = [String]()
        for i in 0...series.count - len {
            out.append(series[i..<i+len].joined(separator:""))
        }

        return out
    }
}
