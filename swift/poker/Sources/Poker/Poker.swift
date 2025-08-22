import Foundation

extension BidirectionalCollection where Self.Element == String {
    func join(_ with:String) -> String { self.joined(separator:with) }
}
extension String {
    func split(_ by:String) -> [String] { self.components(separatedBy:by) }
    func replace(_ match:String, _ replace:String) -> String { String(self.replacingOccurrences(of:match, with:replace, options:.regularExpression)) }
    subscript(i: Int) -> String { String(self[index(startIndex, offsetBy: i)]) }
}

let CARD_ORDER = Array("0123456789XJQKA").map({String($0)})
let HAND_TYPES = ["high_card","1_pair","2_pairs","3_of_a_kind","straight","flush","full_house","4_of_a_kind","straight_flush"]

class Hand {
    var cards:String

    init(_ cards:String) { self.cards = cards }

    func sortedVals(_ val:Int, _ dict:[String:Int]) -> [Int] {
        var out = [Int]()
        for (card, value) in dict {
            if value == val { out.append(Int(CARD_ORDER.firstIndex(of:card)!)) }
        }
        return out.sorted().reversed()
    }

    func handVal(_ type:String) -> Int {
        Int(HAND_TYPES.firstIndex(of:type)!)
    }

    func handType() -> [Int] {

        // parse the hand
        let cards = cards.replace("10","X").split(" ")
        var ranks = [String:Int](), suits = Set<String>()
        for card in cards {
            let number = card[0], suit = card[1]
            ranks[number, default:0] += 1
            suits.insert(suit)
        }
        let singles = sortedVals(1,ranks), doubles = sortedVals(2,ranks), triples = sortedVals(3,ranks), quads = sortedVals(4,ranks)
        var compValues = quads + triples + doubles + singles
        let is5HighStraight = ["A","2","3","4","5"].allSatisfy(ranks.keys.contains)

        // evaluate hand types
        var types = [String:Bool]()
        types["straight"] = (ranks.keys.count == 5 && compValues.max()! - compValues.min()! == 4) || is5HighStraight
        types["flush"] = suits.count == 1
        types["straight_flush"] = types["straight"]! && types["flush"]!
        types["3_of_a_kind"] = triples.count == 1
        types["1_pair"] = doubles.count == 1
        types["full_house"] = types["3_of_a_kind"]! && types["1_pair"]!
        types["4_of_a_kind"] = quads.count == 1
        types["2_pairs"] = doubles.count == 2
        types["high_card"] = true

        if is5HighStraight { compValues.removeFirst() } // remove the ace
        for type in HAND_TYPES.reversed() {
            if types[type]! { return [handVal(type)] + compValues }
        }
        return [] // should never get here
    }

    static func >(lhs: Hand, rhs: Hand) -> Bool {
        let v1 = lhs.handType(), v2 = rhs.handType()

        // start with hand type then high cards
        for (i,val1) in v1.enumerated() {
            if val1 != v2[i] { return val1 > v2[i] }
        }
        return false
    }
}

class Poker {
    var hands:[String]

    init (_ hands:[String]) {
        self.hands = hands
    }

    func bestHands() -> String {
        var hands = hands
        var best = Hand(hands.removeFirst())
        for h in hands {
            let hand = Hand(h)
            if hand > best { best = hand }
        }
        return best.cards
    }
}
