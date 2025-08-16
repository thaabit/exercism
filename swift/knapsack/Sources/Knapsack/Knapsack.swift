struct Knapsack {
    static func maximumValue(_ items:[Item], _ maxWeight:Int) -> Int {
        var endIndex = items.count - 1, maxValue = 0
        func checkItems(_ startIndex:Int,_ curWeight:Int,_ curValue:Int) {
            if curValue > maxValue { maxValue = curValue }
            if startIndex > endIndex { return }
            for index in startIndex...endIndex {
                let item = items[index]
                if (curWeight + item.weight <= maxWeight) {
                    checkItems(startIndex + 1, curWeight + item.weight, curValue + item.value)
                    checkItems(startIndex + 1, curWeight, curValue)
                    break
                }
            }
        }
        checkItems(0,0,0)
        return maxValue
    }
}
