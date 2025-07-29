class Pangram
  def self.pangram?(sentence)
    sentence.downcase.scan(/[a-z]/).uniq.length == 26
  end
end
