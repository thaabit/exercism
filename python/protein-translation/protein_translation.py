mapping = {
    "AUG": "Methionine",
    "UUU": "Phenylalanine",
    "UUC": "Phenylalanine",
    "UUA": "Leucine",
    "UUG": "Leucine",
    "UCU": "Serine",
    "UCA": "Serine",
    "UCC": "Serine",
    "UCG": "Serine",
    "UAU": "Tyrosine",
    "UAC": "Tyrosine",
    "UGU": "Cysteine",
    "UGC": "Cysteine",
    "UGG": "Tryptophan",
    "UAA": "STOP",
    "UAG": "STOP",
    "UGA": "STOP",
}

def proteins(strand):
    start = 0
    resp = []
    while 1:
        if start + 2 >= len(strand): break
        codon = strand[start:start + 3]
        protein = mapping[codon]
        if protein == 'STOP':
            break
        else:
            resp.append(protein)
        start += 3
    return resp
