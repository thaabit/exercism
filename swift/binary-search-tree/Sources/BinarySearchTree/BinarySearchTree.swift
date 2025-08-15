class BinarySearchTree {
    var data: Int
    var left:BinarySearchTree? = nil
    var right:BinarySearchTree? = nil

    init(_ data:Int) {
        self.data = data
    }

    func insert(_ data:Int) {
        if data <= self.data {
            if let left = self.left {
                left.insert(data)
            } else {
                self.left = BinarySearchTree(data)
            }
        } else {
            if let right = self.right {
                right.insert(data)
            } else {
                self.right = BinarySearchTree(data)
            }
        }
    }

    func allData() -> [Int] {
        var out = [Int]()
        if self.left != nil {
            out = self.left!.allData() + out
        }
        out.append(self.data)
        if self.right != nil {
            out += self.right!.allData()
        }
        return out
    }
}
