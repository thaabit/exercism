let mapping : [String:String] = [
    "G": "C",
    "C": "G",
    "T": "A",
    "A": "U",
]

func toRna(_ dna: String) -> String {
    var rna = ""
    let dna = Array(dna)
    for c in dna {
        let c = String(c)
        rna += mapping[c]!
    }
    return rna
}
