import Foundation
let letters = Array("abcdefghijklmnopqrstuvwxyz0123456789").map { String($0) }
let cipher  = Array("zyxwvutsrqponmlkjihgfedcba0123456789").map { String($0) }

class AtbashCipher {
    static func encode(_ phrase: String) -> String {
        var out = "", count = 0
        for l in Array(phrase).map({String($0).lowercased()}) {
            guard l.wholeMatch(of:#/[a-z0-9]/#) != nil else { continue }
            if count == 5 { out += " "; count = 0 }
            out += cipher[letters.firstIndex(of:l)!]
            count += 1
        }
        return out
    }

    static func decode(_ phrase: String) -> String {
        var out = ""
        for l in Array(phrase).map({String($0)}) {
            guard l != " " else { continue }
            out += letters[cipher.firstIndex(of:l)!]
        }
        return out
    }
}
