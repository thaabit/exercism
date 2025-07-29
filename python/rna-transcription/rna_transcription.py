mapping = {
    'G': 'C',
    'C': 'G',
    'T': 'A',
    'A': 'U',
}

def to_rna(dna_strand):
    rna = []
    for i in dna_strand:
        rna.append(mapping[i])
    return ''.join(rna)
