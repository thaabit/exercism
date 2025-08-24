class Nucleotide
  def initialize(dna)
    throw ArgumentError unless dna.match(/^[ACGT]*$/)
    @dna = dna.chars
  end
  def self.from_dna(dna)
    new(dna)
  end
  def count()
    @dna.count
  end
  def histogram
    @dna.tally
  end

end
puts Nucleotide.from_dna('AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC').histogram
