class Anagram
  def initialize(word)
    @word = word.downcase
  end
  def match(words)
    orig_alpha = @word.chars.sort.join
    words.select do |word|
      word.downcase != @word && word.downcase.chars.sort.join == orig_alpha
    end
  end
end
