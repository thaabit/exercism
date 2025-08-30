class Affine
  ALPHA = [*'a'..'z'].join

  def initialize(a, b)
    raise ArgumentError unless a.gcd(ALPHA.length) == 1
    @a, @b = a, b
    @cipher = ALPHA.chars.map { |char| ALPHA[(@a * ALPHA.index(char) + @b) % ALPHA.length] }.join
  end

  def encode(plaintext)
    plaintext.downcase.gsub(/\W/,"").tr(ALPHA, @cipher).chars.each_slice(5).map(&:join).join(" ")
  end

  def decode(ciphertext)
    ciphertext.delete(' ').tr(@cipher, ALPHA)
  end
end
