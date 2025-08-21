let EMPTY = -1
struct Dominoes {
    var dominoes:[(Int, Int)]
    var chained: Bool {
        guard dominoes.count > 0 else { return true }

        func findNext(_ chain:[(Int, Int)], _ remaining:[(Int, Int)]) -> Bool {
            if remaining.isEmpty { return chain.first!.0 == chain.last!.1 }
            let curPip = chain.count > 0 ? chain.last!.1 : EMPTY
            for i in 0..<remaining.count {
                var remaining = remaining
                let next = remaining.remove(at:i)
                for next in [next, (next.1, next.0)] {
                    if curPip == EMPTY || curPip == next.0 {
                        if findNext(chain + [next], remaining) { return true }
                    }
                }
            }
            return false
        }

        return findNext([(Int, Int)](), dominoes)
    }

    init (_ dominoes:[(Int, Int)]) {
        self.dominoes = dominoes
    }
}
