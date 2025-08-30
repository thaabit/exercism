class RotationalCipher
  UPPER = ('A'..'Z').to_a
  LOWER = ('a'..'z').to_a
  def self.rotate(string, offset)
    string.chars.map { |char, out|
      letters = UPPER.include?(char) ? UPPER : LOWER.include?(char) ? LOWER : nil
      letters ? letters[(letters.index(char) + offset) % 26] : char
    }.join
  end
end
