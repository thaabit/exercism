class Element<T> {
    var value:T?
    var next:Element<T>?

    init(_ val:T?, _ next:Element?) {
        self.next = next
        self.value = val
    }
    init(){}

    func reverseElements() -> Element<T> {
        Element<T>.fromArray(toArray().reversed())
    }

    func toArray() -> [T] {
        var out:[T] = []
        var cur:Element? = self
        while cur != nil {
            if let val = cur?.value { out.append(val) }
            cur = cur?.next
        }
        return out
    }

    static func fromArray(_ arr:[T]) -> Element<T> {
        if arr.count == 0 { return Element() }
        var arr = arr
        let first:Element<T> = Element(arr.removeFirst(), nil)
        var prev = first
        for i in arr {
            prev.next = Element(i, nil)
            prev = prev.next!
        }
        return first
    }
}
