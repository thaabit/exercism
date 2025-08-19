func encode(_ message:String, rails:Int) -> String {
    var forward = true, railArray = [String](), msg = Array(message)
    railArray.append(String(msg.removeFirst()))
    OUTER: while true {
        let span = forward ? stride(from:1, to:rails, by:1) :  stride(from:rails-2, to:-1, by:-1)
        forward = !forward
        for railIdx in span {
            if msg.isEmpty { break OUTER }
            if !railArray.indices.contains(railIdx) { railArray.append("") }
            railArray[railIdx].append(msg.removeFirst())
        }
    }
    return railArray.joined(separator:"")
}

func decode(_ message:String, rails:Int) -> String {
    var railStarts = [Int](), msg = Array(message)
    let circuitLength = ((rails - 1) * 2)
    let circuits = msg.count / circuitLength
    let extra = msg.count - circuits * circuitLength
    var out = String(msg.removeFirst())
    var index = 0
    railStarts.append(index)  // top rail
    index += circuits - 1
    if extra > 0 { index += 1 }
    for i in 1..<rails {
        railStarts.append(index)
        index += circuits * 2
        if extra > i { index += 1 }
        if extra >= (rails * 2) - (rails - i)  { index += 1 }
    }
    var forward = true, rail = 1
    while true {
        if out.count == message.count { break }
        out.append(msg[railStarts[rail]])
        railStarts[rail] += 1
        rail += forward ? 1 : -1
        if (rail == 0) {
            forward = true
        } else if (rail == rails - 1) {
            forward = false
        }
    }
    return out
}
