class RunLengthEncoding
  def self.encode(string)
    [*'A'..'Z', *'a'..'z', ' '].each { |char|
      string = string.gsub(/#{char}#{char}+/) { |match|
        match.length.to_s + char
      }
    }
    string
  end

  def self.decode(string)
      string.gsub(/\d+[A-Za-z ]/) { |match| match[-1] * match[0..-1].to_i }
  end
end
