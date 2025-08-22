import Foundation

extension BidirectionalCollection where Self.Element == String {
    func join(_ with:String) -> String { self.joined(separator:with) }
}
extension String {
    func split(_ by:String) -> [String] { self.components(separatedBy:by) }
    func replace(_ match:String, _ replace:String) -> String { String(self.replacingOccurrences(of:match, with:replace, options:.regularExpression)) }
    subscript(i: Int) -> String { String(self[index(startIndex, offsetBy: i)]) }
}

class Hand {
    var cards:String
    static let CARD_ORDER = Array("0123456789XJQKA").map({String($0)})
    static let HAND_TYPES = ["HC","1P","2P","3K","ST","FL","FH","4K","SF"]

    init(_ cards:String) { self.cards = cards }

    func byCardValue(lhs:String, rhs:String) -> Bool { Hand.cardVal(lhs) < Hand.cardVal(rhs) }

    func cardsOfValue(_ val:Int, _ dict:[String:Int]) -> [String] {
        var out = [String]()
        for (key, value) in dict {
            if value == val { out.append(key) }
        }
        return out.sorted(by:byCardValue).reversed()
    }


    static func cardVal(_ card:String) -> Int {
        Int(CARD_ORDER.firstIndex(of:card)!)
    }
    static func handVal(_ type:String) -> Int { Int(HAND_TYPES.firstIndex(of:type)!) }

    func handType() -> (String,[String]) {
        let cards = cards.replace("10","X").split(" ")
        var nums = [String:Int](), suits: Set<String>
        for card in cards {
            let number = card[0], suit = card[1]
            nums[number, default:0] += 1
            suits.insert(suit)
        }
        let highCard = nums.keys.max(by: byCardValue)!, lowCard = nums.keys.min(by: byCardValue)!
        let highCardVal = Hand.cardVal(highCard), lowCardVal = Hand.cardVal(lowCard)
        let ones = cardsOfValue(1,nums), twos = cardsOfValue(2,nums), threes = cardsOfValue(3,nums), fours = cardsOfValue(4,nums)
        let isFiveHighStraight = ["A","2","3","4","5"].allSatisfy(nums.keys.contains)

        let isST = (nums.keys.count == 5 && highCardVal - lowCardVal == 4) || isFiveHighStraight
        let isFL = suits.count == 1
        let isSF = isST && isFL
        let is3K = threes.count == 1
        let is1P = twos.count == 1
        let isFH = is3K && is1P
        let is4K = fours.count == 1
        let is2P = twos.count == 2

        var compCards = fours + threes + twos + ones
        if isFiveHighStraight { compCards.removeFirst() } // remove the ace
        if isSF { return ("SF", compCards) }
        if is4K { return ("4K", compCards) }
        if isFH { return ("FH", compCards) }
        if isFL { return ("FL", compCards) }
        if isST { return ("ST", compCards) }
        if is3K { return ("3K", compCards) }
        if is2P { return ("2P", compCards) }
        if is1P { return ("1P", compCards) }
        return ("HC", compCards)
    }

    static func >(lhs: Hand, rhs: Hand) -> Bool {

        let v1 = lhs.handType(), v2 = rhs.handType()
        let handType1  = v1.0, handType2  = v2.0
        let compCards1 = v1.1, compCards2 = v2.1
        let handVal1 = handVal(handType1), handVal2 = handVal(handType2)

        // compare hands first
        if handVal1 != handVal2 { return handVal1 > handVal2 }

        // now compare high cards
        for i in 0..<compCards1.count {
            let c1 = cardVal(compCards1[i]), c2 = cardVal(compCards2[i])
            if c1 != c2 { return c1 > c2 }
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
        var best = Hand(hands[0])
        for hand in hands {
            if best.cards == hand { continue }
            let hand = Hand(hand)
            if hand > best { best = hand }
        }
        return best.cards
    }
}
