func getName(_ item: (name: String, amount: Int)) -> String {
    item.name
}

func createToy(name: String, amount: Int) -> (name: String, amount: Int) {
    (name: name, amount: amount)
}

func updateQuantity(_ items: [(name: String, amount: Int)], toy: String, amount: Int) ->  [(name: String, amount: Int)] {
    var new_items : [(name: String, amount: Int)] = []
    for item in items {
        new_items.append((
            name: item.name,
            amount: (item.name == toy ? amount : item.amount),
        ))
    }
    return new_items
}

func addCategory(_ items: [(name: String, amount: Int)], category: String) -> [(name: String, amount: Int, category: String)] {
    var new_items : [(name: String, amount: Int, category: String)] = []
    for i in items {
        new_items.append((name: i.name, amount: i.amount, category: category))
    }
    return new_items
}
