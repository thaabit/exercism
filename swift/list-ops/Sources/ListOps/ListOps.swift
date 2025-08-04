class ListOps {
    static func append(_ l1:[Int],_ l2:[Int]) -> [Int] {
        l1 + l2
    }

    static func append(lists:[Int]...) -> [Int] {
        var out : [Int] = []
        for list in lists {
            out += list
        }
        return out
    }

    static func length(list:[Int]) -> Int {
        list.count
    }

    static func map(list: [Int, )

}
