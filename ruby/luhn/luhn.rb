class Luhn
  def self.valid?(str)
    str = str.gsub(/ /, '')
    return false if str.length <= 1
    return false unless str.match(/^\d+$/)
    (str.chars.reverse.map.with_index do |char, idx|
      num = char.to_i
      out = idx % 2 != 0 ? num * 2 : num
      out = out - 9 if out > 9
      out
    end).sum % 10 == 0
  end
end
