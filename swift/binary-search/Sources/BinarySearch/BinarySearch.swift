enum BinarySearchError: Error {
    case valueNotFound
}
class BinarySearch {
  var list : [Int]

  init(_ list: [Int]) {
    self.list = list
  }

  func searchFor(_ num:Int) throws -> Int {
    func search(_ bottom: Int, _ top: Int) throws -> Int {
        let middleIndex = (top + bottom) / 2
        if top > self.list.count || bottom > top || bottom < 0   {
            throw BinarySearchError.valueNotFound
        }
        let middle = self.list[middleIndex]
        if middle == num {
            return middleIndex
        } else if num > middle {
            return try search(middleIndex + 1, top)
        } else {
            return try search(bottom, middleIndex - 1)
        }
    }
    return try search(0, self.list.count - 1)
  }
}
