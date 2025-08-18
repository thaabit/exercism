let letterString = "abcdefghijklmnopqrstuvwxyz"
let letters = Array(letterString).map({String($0)})

class Cipher {
    var key:String
    var keyArray:[String]


    init(key: String) {
        self.key = key
        self.keyArray = Array(key).map { String($0) }
    }
    init() {
        self.key = letterString
        self.keyArray = letters
    }

    func decode(_ plaintext:String) -> String {
        var out = ""
        for (i,c) in Array(plaintext).map({String($0)}).enumerated() {
            let offset = letters.firstIndex(of: c)! - letters.firstIndex(of: keyArray[i % key.count])!
            out.append(letters[(offset + 26) % 26])
        }
        return out
    }

    func encode(_ plaintext:String) -> String {
        var out = ""
        for (i,c) in Array(plaintext).map({String($0)}).enumerated() {
            let offset = letters.firstIndex(of: c)! + letters.firstIndex(of: keyArray[i % key.count])!
            out.append(letters[(offset + 26) % 26])
        }
        return out
    }
}
