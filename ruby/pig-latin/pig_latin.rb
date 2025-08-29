class PigLatin
  def self.translate(words)
    words.split(" ").map { |word|
      first, rest = "", ""
      if word[0].match(/[aieou]/) or word.match(/^(xr|yt)/)
        first = word
      elsif m = word.match(/^([^aeiou]+)(y.*?)$/)
        first, rest = m.captures
      elsif m = word.match(/^(.?qu|[^aeiou]+)(.*?)$/)
        first, rest = m.captures
      end
      rest + first + "ay"
    }.join(" ")
  end
end
