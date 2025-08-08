class Acronym
  def self.abbreviate(text)
    (text.split(/[\W\s]+/).map { |word| word[0] }).join.upcase
  end
end
