class Cipher

  attr_reader :key
  def rand_cipher
    100.times.map { ('a'..'z').to_a[Random.rand(26)] }.join
  end
  def initialize(key=rand_cipher)
    raise ArgumentError unless key.match(/^[a-z]+$/)
    @key = key
    @alpha = ('a'..'z').to_a
  end

  def encode(plaintext)
    @key.chars.cycle.first(plaintext.length).zip(plaintext.chars).map { |(cipher, char)|
      @alpha[(@alpha.index(cipher) + @alpha.index(char)) % 26]
    }.join
  end

  def decode(encodedtext)
    @key.chars.cycle.first(encodedtext.length).zip(encodedtext.chars).map { |(cipher, char)|
      @alpha[(@alpha.index(char) - @alpha.index(cipher)) % 26]
    }.join

  end

end
