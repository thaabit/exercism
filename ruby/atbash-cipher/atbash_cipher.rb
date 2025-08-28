LETTERS = 'abcdefghijklmnopqrstuvwxyz'.chars
KEY = 'zyxwvutsrqponmlkjihgfedcba'.chars
ENCODER = LETTERS.zip(KEY).to_h
DECODER = KEY.zip(LETTERS).to_h

class Atbash
  def self.encode(input)
    input.gsub(/\W/,"").downcase.chars.each_with_object([]) { |char, out|
      out << (ENCODER[char] || char)
    }.each_slice(5).map(&:join).join(" ")
  end
  def self.decode(input)
    input.gsub("\s","").downcase.chars.each_with_object([]) { |char, out|
      out << (DECODER[char] || char)
    }.join
  end
end
