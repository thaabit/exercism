class Affine
  LOWER = ('a'..'z').to_a

  def initialize(a, b)
    @a, @b = a, b
  end

  def encode(plaintext)
    plaintext.downcase.chars.map { |char|
      LOWER.include?(char) ? LOWER[(@a * LOWER.index(char) + @b) % 26] : ""
    }.each_slice(5).to_a.map(&:join).join(" ")
  end

  def decode(ciphertext)
    ciphertext.chars.map { |char|
      p [char, (@a**-1), LOWER.index(char), @b].inspect
      LOWER.include?(char) ? LOWER[(@a**-1) * (LOWER.index(char) - @b) % 26] : ""
    }.join
  end
end
p cipher = Affine.new(19, 16).decode('qdwju nqcro muwhn odqun oppmd aunwd o')
