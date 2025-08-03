import Foundation

func gigasecond(from: Date) -> Date {
  let epoch = Double(from.timeIntervalSince1970) + 1_000_000_000
  return Date(timeIntervalSince1970: epoch)
}
