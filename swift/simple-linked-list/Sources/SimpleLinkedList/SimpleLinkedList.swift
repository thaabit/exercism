class Element {
    var next:Element?
    var value:Int?

    init(_ val:Int?, _ next:Element?) {
        self.value = val
        self.next = next
    }

    func reverseElements() -> Element {
        next = self.next!
        while next != nil {
            next!.next = self
            next = next!.next
        }
        return next!
    }

    func toArray() -> [Int] {
        var out:[Int] = [self.value!]
        var next = self.next
        while next != nil {
            out.append(next!.value!)
            next = self.next
        }
        return out
    }

    static func fromArray(_ arr:[Int]) -> Element {
        var arr = arr
        let first:Element = Element(arr.removeFirst(), nil)
        var prev = first
        for i in arr {
            prev.next = Element(i, nil)
            prev = prev.next!
        }
        return first
    }
}
