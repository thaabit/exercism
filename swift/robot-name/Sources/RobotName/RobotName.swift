class Robot {
    let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let ints = "1234567890"
    var name:String = ""

    func resetName() {
        name = ""
        for _ in 1...2 { name += String(letters.randomElement()!) }
        for _ in 1...3 { name += String(ints.randomElement()!) }
    }

    init(){
        resetName()
    }
}
