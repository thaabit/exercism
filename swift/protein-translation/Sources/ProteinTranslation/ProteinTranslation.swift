enum TranslationError : Error {
    case invalidCodon
}

let map = [
    "AUG": "Methionine",
    "UUU": "Phenylalanine",
    "UUC": "Phenylalanine",
    "UUA": "Leucine",
    "UUG": "Leucine",
    "UCU": "Serine",
    "UCC": "Serine",
    "UCA": "Serine",
    "UCG": "Serine",
    "UAU": "Tyrosine",
    "UAC": "Tyrosine",
    "UGU": "Cysteine",
    "UGC": "Cysteine",
    "UGG": "Tryptophan",
    "UAA": "STOP",
    "UAG": "STOP",
    "UGA": "STOP",
]

func translationOfRNA(rna strand: String) throws -> [String] {
    let len = strand.count
    var out : [String] = []
    let startIndex = strand.startIndex
    for index in stride(from:0, to: len, by: 3) {
        guard index + 2 < len else { throw TranslationError.invalidCodon }
        let start = strand.index(startIndex, offsetBy: index)
        let end = strand.index(startIndex, offsetBy: index + 2)
        let code = String(strand[start...end])
        if let protein = map[code] {
            if protein == "STOP" { break }
            else { out.append(protein) }
        } else {
            throw TranslationError.invalidCodon 
        }
    }
    return out
}
