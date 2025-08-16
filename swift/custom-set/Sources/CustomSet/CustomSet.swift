class CustomSet: Equatable {
    var set:Set<Int>
    var isEmpty:Bool { self.set.count == 0 }

    init(_ set:[Int]) { self.set = Set(set) }

    func add(_ val:Int) { set.insert(val) }

    func contains(_ val:Int)        -> Bool { self.set.contains(val) }
    func isSubset(of:CustomSet)     -> Bool { set.isSubset(of:of.set) }
    func isDisjoint(with:CustomSet) -> Bool { with.set.intersection(set).count == 0 }
    static func == (lhs:CustomSet, rhs:CustomSet) -> Bool { lhs.set == rhs.set }

    func intersection(_ with:CustomSet) -> CustomSet { CustomSet(Array(set.intersection(with.set))) }
    func difference(_ of:CustomSet)     -> CustomSet { CustomSet(Array(set.subtracting(of.set))) }
    func union(_ with:CustomSet)        -> CustomSet { CustomSet(Array(set.union(with.set))) }
}
