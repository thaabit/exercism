// TODO: define the 'LogLevel' enum, its `init`, and its `shortFormat` method
enum LogLevel : String {
    case trace   = 0
    case debug   = 1
    case info    = 4
    case warning = 5
    case error   = 6
    case fatal   = 7
    case unknown = 42

    init(msg: String) {
        var lvl = "unknown"
        if let short = /^\[(.*?)\]/.wholeMatch(in: msg) {
            switch String(short) {
                case "TRC": lvl = "trace"
                case "DBG": lvl = "debug"
                case "INF": lvl = "info"
                case "WRN": lvl = "warning"
                case "ERR": lvl = "error"
                case "FTL": lvl = "fatal"
                default   : lvl = "unknown"
            }
        }
    }

    func shortFormat(msg : String) -> String {
        "\(self.rawValue): \(msg)"
    }
}
