class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = Hash.new(0)
    @phrase.split(/[,\.\s]+/).each do |word|
      word = word.sub(/^\W+/, "").sub(/\W+$/, "").downcase
      next if word == ''
      words[word] += 1
    end
    return words
  end
end
