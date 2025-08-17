let dec2roman = [
    1: "I",
    4: "IV",
    5: "V",
    9: "IX",
    10: "X",
    40: "XL",
    50: "L",
    90: "XC",
    100: "C",
    400: "CD",
    500: "D",
    900: "CM",
    1000: "M",
]
extension Int {
    func toRomanNumeral() -> String {
        var i = self, out = ""
        for dec in dec2roman.keys.sorted().reversed() {
            while (i >= dec) {
                out += dec2roman[dec]!
                i -= dec
            }
        }
        return out
    }
}
