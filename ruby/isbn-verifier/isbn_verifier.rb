class IsbnVerifier
  def self.valid?(string)
    return false if string.match?(/[^0-9X-]/)
    string = string.gsub(/-/,'')
    return false if string.length != 10
    return false if string.match?(/X./)

    string.chars.reverse.map.with_index { |num, i|
      num = num == 'X' ? 10 : num.to_i
      num * (i + 1)
    }.sum % 11 == 0
  end
end
