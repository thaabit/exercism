class Isogram
  def self.isogram?(input)
    found = {}
    input.downcase.chars.each do |char|
      next if ['-',' '].include?(char)
      return false if found[char]
      found[char] = 1
    end
    return true
  end
end
