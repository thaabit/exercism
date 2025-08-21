import Foundation

struct Transpose {
    static func transpose(_ lines: [String]) -> [String] {
        var out = [String]()
        let max = (lines.max(by:{ $0.count < $1.count }) ?? "").count
        for line in lines {
            let line = Array(line)
            for x in 0..<max {
                //if x >= line.count { continue }
                let c = line.indices.contains(x) ? line[x] : " "
                if out.indices.contains(x) {
                    out[x].append(c)
                }
                else {
                    out.append(String(c))
                }
            }
        }
        out = out.map { $0.replacingOccurrences(of:"\\s+$", with:"", options:.regularExpression) }

        return out
    }
}
//print(Transpose.transpose(["The first line.", "The second line."]))
