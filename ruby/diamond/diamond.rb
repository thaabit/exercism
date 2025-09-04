class Diamond
  def self.pad(length)
    " " * length
  end
  def self.make_diamond(letter)
    letters = [*'A'..letter]
    width = ((letters.size - 1) * 2)
    half = width / 2
    out = letters.map.with_index { |l, i|
      i == 0 ? pad(half) + l + pad(half) : pad(half - i) + l + pad(i*2 - 1) + l + pad(half - i)
    }
    out += out[0..-2].reverse
    out.join("\n") + "\n"
  end
end
