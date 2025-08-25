class Bob
  def self.hey(remark)
    is_question = remark.match?(/\?\s*\z/)
    is_silence = remark.match?(/\A\s*\z/)
    is_yelling = remark.gsub(/[\W\d\s]/,'').match?(/^[A-Z]+$/)

    return "Calm down, I know what I'm doing!" if is_yelling and is_question
    return "Whoa, chill out!" if is_yelling
    return "Sure." if is_question
    return "Fine. Be that way!" if is_silence
    return "Whatever."
  end
end
