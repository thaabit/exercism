func remainingMinutesInOven(elapsedMinutes elapsed: Int, expectedMinutesInOven expected: Int = 40) -> Int {
    expected - elapsed
}

func preparationTimeInMinutes(layers: String...) -> Int {
    layers.count * 2
}

func quantities(layers: String...) ->  (noodles: Int, sauce: Double) {
    var noodles = 0
    var sauce = 0.0
    for l in layers {
        if l == "noodles" { noodles += 3 }
        if l == "sauce"   { sauce += 0.2 }
    }
    return (noodles: noodles, sauce: sauce)
}

let OZ_PER_LITER = 33.814
func toOz(_ tuple: inout (noodles: Int, sauce: Double)) {
    tuple.sauce *= OZ_PER_LITER
}

func redWine(layers: String...) -> Bool {
    let white = layers.count { ["mozzarella", "béchamel", "ricotta"].contains($0) }
    let red   = layers.count { ["sauce", "meat"].contains($0) }
    return red >= white
}
