import Foundation

func sliceSize(diameter: Double?, slices: Int?) -> Double? {
    guard let diameter = diameter, let slices = slices, diameter >= .zero, slices > .zero else { return nil }
    return .pi * pow((diameter / 2), 2) / Double(slices)
}

func biggestSlice(
  diameterA: String, slicesA: String,
  diameterB: String, slicesB: String
) -> String {
    let sliceA = sliceSize(diameter: Double(diameterA), slices: Int(slicesA)) ?? -1
    let sliceB = sliceSize(diameter: Double(diameterB), slices: Int(slicesB)) ?? -1

    return   sliceA == sliceB ? "Neither slice is bigger"
           : sliceA >  sliceB ? "Slice A is bigger"
           :                    "Slice B is bigger"
}
