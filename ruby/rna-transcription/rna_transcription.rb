class Complement
  def self.of_dna(string)
    string.tr('GCTA', 'CGAU')
  end
end
