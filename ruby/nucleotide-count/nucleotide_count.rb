class Nucleotide
  def initialize(dna)
    throw ArgumentError unless dna.match(/^[ACGT]*$/)
    @dna = dna.chars
  end

  def self.from_dna(dna)
    new(dna)
  end

  def count(nucleotide)
    @dna.count(nucleotide)
  end

  def histogram
    tally = @dna.tally
    'ATCG'.chars.each { |nuc| tally[nuc] ||= 0 }
    tally
  end

end
