import Foundation

struct Transpose {
    static func transpose(_ lines: [String]) -> [String] {
        var out = [String]()
        let max = (lines.max(by:{ $0.count < $1.count }) ?? "").count
        for line in lines {
            let line = Array(line)
            for x in 0..<max {
                let c = line.indices.contains(x) ? line[x] : "\0"
                if out.indices.contains(x) {
                    out[x].append(c)
                }
                else {
                    out.append(String(c))
                }
            }
        }
        out = out.map {
            $0.replacingOccurrences(of:"\0+$", with:"", options:.regularExpression)
              .replacingOccurrences(of:"\0", with:" ", options:.regularExpression)
        }

        return out
    }
}
