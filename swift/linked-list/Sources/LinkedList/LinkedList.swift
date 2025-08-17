class Deque<T: Equatable> {
    var deque = [T]()
    var count:Int { deque.count }

    init(){ deque = [] }

    @discardableResult
    func pop() -> T { deque.removeLast() }
    @discardableResult
    func shift() -> T { deque.removeFirst() }

    func push(_ element:T) { deque.append(element) }
    func unshift(_ element:T) { deque.insert(element, at: 0) }
    func delete(_ element:T) {
        if let idx = deque.firstIndex(of:element) {
            deque.remove(at:idx)
        }
    }
}
