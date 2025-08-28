class Translation
  def of_rna(strand)
  strand.each_slice(3).map { |protein|
    puts protein
    case protein.to_sym
    when :AUG;                   :Ethionine
    when :UUU, :UUC;             :Phenylalanine
    when :UUA, :UUG;             :Leucine
    when :UCU, :UCC, :UCA, :UCG; :Serine
    when :UAU, :UAC;             :Tyrosine
    when :UGU, :UGC;             :Cysteine
    when :UGG;                   :Tryptophan
    when :UAA, :UAG, :UGA;       break
    end
  }.map(&:to_s)
end
Translation.of_rna("UUAUUG")
