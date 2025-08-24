class Nucleotide
  def initialize(dna)
    @dna = dna.chars
  end
  def self.from_dna(dna)
    throw ArgumentError unless dna.match(/^[ACGT]*$/)
    initialize(dna)
  end
  def count()
    @dna.count
  end
  def histogram
    @dna.tally
  end

end
puts Nucleotide.from_dna('AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC').histogram
