class Element<T> {
    var next:Element?
    var value:T?

    init(_ val:T? = nil, _ next:Element? = nil) {
        self.value = val
        self.next = next
    }

    func reverseElements() -> Element {
        if let next = self.next {
            print(next.value)
            next.next = self
            return next.reverseElements()
        }
        return self
    }

    func toArray() -> [T] {
        var out:[T] = [self.value!]
        var next = self.next
        while next != nil {
            out.append(next!.value!)
            next = self.next
        }
        return out
    }

    static func fromArray(_ arr:[T]) -> Element {
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

    let one = Element(1, nil)
    let two = Element(2, one)
    print(one.next ?? 0, two.next ?? 0)
    let twoR = two.reverseElements()
    print(twoR.value!)
    print(twoR.next?.value)
