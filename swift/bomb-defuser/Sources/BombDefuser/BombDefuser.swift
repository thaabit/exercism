typealias ChangeClosure = @Sendable ((String, String, String)) -> (String, String, String)

let flip: ChangeClosure = { wires in 
    (wires.1, wires.0, wires.2)
}
let rotate: ChangeClosure = { wires in
    (wires.1, wires.2, wires.0)
}

func makeShuffle(
  flipper: @escaping ((String, String, String)) -> (String, String, String),
  rotator: @escaping ((String, String, String)) -> (String, String, String)
) -> ([UInt8], (String, String, String)) -> (String, String, String) {
  { idNumber, wires in
    var wires = wires
    for i in idNumber.reversed() {
        wires = i == 1 ? rotate(wires) : flip(wires)
    }
    return wires
  }
}
