class RunLengthEncoding {

    static func encode(_ phrase : String) -> String {
        var out = "", cur = "", cnt = 0
        for c in phrase {
            let c = String(c)
            if c == cur {
                cnt += 1
            } else {
                if cnt > 0 { out += cnt > 1 ? "\(cnt)\(cur)" : "\(cur)" }
                cur = c
                cnt = 1
            }
        }
        if cnt > 0 { out += cnt > 1 ? "\(cnt)\(cur)" : "\(cur)" }
        return out
    }

    static func decode(_ phrase : String) -> String {
        var out = "", digits = ""
        for c in phrase {
            if ("0"..."9").contains(c) {
                digits.append(c)
            } else {
                out += String(repeating: c, count: Int(digits) ?? 1)
                digits = ""
            }
        }
        return out
    }
}
