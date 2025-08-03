import Foundation

enum ResistorColor {
    let colors = [
        "black",
        "brown",
        "red",
        "orange",
        "yellow",
        "green",
        "blue",
        "violet",
        "grey",
        "white",
    ]
    func colorCode(for color:String) -> Int {
        colors.firstIndex(of: color)
    }
}
