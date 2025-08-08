class Scrabble
  LETTERS = { D:2, G:2, B:3, C:3, M:3, P:3, F:4, H:4, V:4, W:4, Y:4, K:5, J:8, X:8, Q:10, Z:10 }.freeze
  def initialize(word)
    @word = word
  end

  def score
    @word.upcase.chars.map { |l| LETTERS[l.to_sym] || 1 }.sum
  end
end
