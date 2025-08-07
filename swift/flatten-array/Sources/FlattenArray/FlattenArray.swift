func flattenArray(_ array:[Any]) -> [Int] {
    var out : [Int] = []
    func flatten(_ array:[Any]) {
        for i in array {
            if let a = i as? [Any] { flatten(a) } else { out.append(Int(i)) }
        }
    }
    flatten(array)
    return out
}
