func remainingMinutesInOven(elapsedMinutes elapsed: Int, expectedMinutesInOven expected: Int = 40) -> Int {
    expected - elapsed
}

func preparationTimeInMinutes(_ layers: String...) -> Int {
    layers.count
}

func quantities(_ layers: String...) ->  [String: Int] {
    var out : [String: Int] = [:]
    for l in layers {
        if var q = out[l] {
            q += 1
        }
        else {
            out[l] = 1
        }
    }
    return out
}

let OZ_PER_LITER = 33.814
func toOz(_ tuple: inout (noodles: Int, sauce: Double)) {
    tuple.sauce *= OZ_PER_LITER
    return
}

func redWine(_ layers: String...) -> Bool {
    var q = quantities(layers)
    return (q["mozarella"] ?? 0 + q["béchamel"] ?? 0 + q["ricotta"] ?? 0) <= (q["sauce"] ?? 0 + q["meat"] ?? 0)
}
