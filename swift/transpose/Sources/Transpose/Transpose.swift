import Foundation
extension StringProtocol {
    func replace(_ match:String, _ replace:String) -> String {
        String(self.replacingOccurrences(of:match, with:replace, options:.regularExpression))
    }
}

struct Transpose {
    static func transpose(_ lines: [String]) -> [String] {
        let max = (lines.max(by:{ $0.count < $1.count }) ?? "").count
        var out = Array(repeating:"", count:max)
        for line in lines {
            let line = Array(line)
            for x in 0..<max {
                out[x].append(line.indices.contains(x) ? line[x] : "\0")
            }
        }
        return out.map { $0.replace("\0+$","").replace("\0"," ") }
    }
}
