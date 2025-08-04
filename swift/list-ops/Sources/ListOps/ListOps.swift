class ListOps<T> {
    static func append(_ l1:[T],_ l2:[T]) -> [T] {
        l1 + l2
    }

    static func concat(_ items: [[T]]) -> [T] {
        var out = [T]()
        items.forEach { item in
            out += item
        }
        return out.compactMap {$0 as T}
    }

    static func length(_ list:[T]) -> Int {
        list.count
    }

    static func map(_ list: [T], _ function: (T) -> T) -> [T] {
        var result = [T]()
        list.forEach {
            result.append(function($0))
        }
        return result
    }

    static func reverse(_ list:[T]) -> [T] {
        var out = [T]()
        for i in stride(from:list.count - 1, through:0, by:-1) {
            out.append(list[i])
        }
        return out
    }

    static func foldRight(_ list:[T], accumulated: T, function: ((T, T) -> T)) -> T {
        var acc = accumulated
        list.reversed().forEach {
            acc = function($0, acc)
        }
        return acc
    }

    static func foldLeft(_ list:[T], accumulated: T, function: ((T, T) -> T)) -> T {
        var acc = accumulated
        list.forEach {
            acc = function($0, acc)
        }
        return acc
    }

    static func filter(_ list:[T], function: ((T) -> Bool)) -> [T] {
        var out = [T]()
        list.forEach {
            if function($0) {
                out.append($0)
            }
        }
        return out
    }
}
