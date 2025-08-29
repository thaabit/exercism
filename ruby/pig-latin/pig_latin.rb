class PigLatin
  def self.translate(words)
    words.split.map { |word|
      word.match?(/^([aieou]|xr|yt)/) || word.sub!(/^(.?qu|[^aeiou]+(?=y)|[^aeiou]+)(.*?)$/, '\2\1')
      word + "ay"
    }.join(" ")
  end
end
