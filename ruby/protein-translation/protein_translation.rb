class InvalidCodonError < StandardError
end

class Translation
  def self.of_rna(strand)
    strand.chars.each_slice(3).each_with_object([]) { |protein, out|
      case protein.join.to_sym
        when :AUG;                   out << 'Methionine'
        when :UUU, :UUC;             out << 'Phenylalanine'
        when :UUA, :UUG;             out << 'Leucine'
        when :UCU, :UCC, :UCA, :UCG; out << 'Serine'
        when :UAU, :UAC;             out << 'Tyrosine'
        when :UGU, :UGC;             out << 'Cysteine'
        when :UGG;                   out << 'Tryptophan'
        when :UAA, :UAG, :UGA;       break out
        else                         raise InvalidCodonError
      end
    }
  end
end
