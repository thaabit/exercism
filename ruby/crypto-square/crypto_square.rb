class Crypto

  def initialize(input)
    @input = input
  end

  def ciphertext

    text = @input.gsub(/\W/,"").downcase
    l = text.length
    return "" if l < 1

    c = Math.sqrt(l)
    r = (l / c).ceil
    c = c.round

    text.ljust(c * r, padstr=" ")
        .chars
        .each_slice(r)
        .to_a
        .transpose
        .map(&:join)
        .join(" ")
  end
end
