class ListOps {
    static func append(_ l1:[T],_ l2:[T]) -> [T] {
        l1 + l2
    }

    static func append(lists:[T]...) -> [T] {
        var out : [T] = []
        for list in lists {
            out += list
        }
        return out
    }

    static func length(list:[T]) -> T {
        list.count
    }

    static func map(list: [T], _ function: (T) -> T) -> [T] {
        var result = [T]()
        list.forEach {
            result.append(function($0)
        }
        return result
    }

}
