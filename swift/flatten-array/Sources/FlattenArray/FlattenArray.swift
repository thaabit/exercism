func flattenArray(_ array:[Any?]) -> [Int] {
    var out : [Int] = []
    func flatten(_ array:[Any?]) {
        for item in array {
            if let arr = item as? [Any] {
                flatten(arr)
            } else if let i = item as? Int {
                out.append(i)
            }
        }
    }
    flatten(array)
    return out
}
