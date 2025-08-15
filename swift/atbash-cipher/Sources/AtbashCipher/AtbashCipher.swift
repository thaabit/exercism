import Foundation
let letters = Array("abcdefghijklmnopqrstuvwxyz0123456789")
let cipher  = Array("zyxwvutsrqponmlkjihgfedcba0123456789")

class AtbashCipher {
    static func encode(_ phrase: String) -> String {
        var out = "", count = 0
        for l in Array(phrase.lowercased()) {
            guard String(l).wholeMatch(of:#/[a-z0-9]/#) != nil else { continue }
            if count == 5 { out.append(" "); count = 0 }
            out.append(cipher[letters.firstIndex(of:l)!])
            count += 1
        }
        return out
    }

    static func decode(_ phrase: String) -> String {
        var out = ""
        for l in Array(phrase) {
            guard l != " " else { continue }
            out.append(letters[cipher.firstIndex(of:l)!])
        }
        return out
    }
}
