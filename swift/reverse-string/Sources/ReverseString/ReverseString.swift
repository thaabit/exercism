func reverseString(_ input : String) -> String {
    var out = ""
    let arr = Array(input)
    for i in stride(from:arr.count - 1, through:0, by:-1) {
        if let i = Int?(i) {
            out += String(arr[i])
        }
    }
    return out
}
