// TODO: define the 'expectedMinutesInOven' constant
let expectedMinutesInOven = 40

// TODO: define the 'remainingMinutesInOven' function
func remainingMinutesInOven(elapsedMinutes: Int) -> Int {
    expectedMinutesInOven - elapsedMinutes
}

// TODO: define the 'preparationTimeInMinutes' function
func preparationTimeInMinutes(layers: Int) -> Int {
    layers < 1 ? 0 : layers * 2
}

// TODO: define the 'totalTimeInMinutes' function
func totalTimeInMinutes(layers: Int, elapsedMinutes: Int) -> Int {
    elapsedMinutes + preparationTimeInMinutes(layers: layers)
}

