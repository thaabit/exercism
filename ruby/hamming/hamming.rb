class Hamming
  def self.compute(dna1, dna2)
    raise ArgumentError.new("not equal length") if dna1.length != dna2.length
    dna1.chars.map.with_index { |char, index| char != dna2[index] ? 1 : 0 }.sum
  end
end
