enum Type {
    case equal, sublist, superlist, unequal
}

func classifier(listOne one:[Int], listTwo two:[Int]) -> Type {
    if one == two { return .equal }
    if sublist(one, two)  { return .sublist }
    if sublist(two, one)  { return .superlist }
    return .unequal
}

func sublist(_ one:[Int], _ two:[Int]) -> Bool {
    if one.count == 0 {
        return true
    }
    else {
        for (idx2, _) in two.enumerated() {
            if idx2 + one.count > two.count { break }
            var sub = true
            for (idx1, e1) in one.enumerated() {
                if e1 != two[idx2 + idx1] {
                    sub = false
                    break
                }
            }
            if sub == true { return true }
        }
    }
    return false
}
