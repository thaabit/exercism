class Bob
  def self.hey(remark)
    is_question = remark.match?(/\?\s*\z/)
    is_silence = remark.match?(/\A\s*\z/)
    is_yelling = remark.gsub(/[\W\d\s]/,'').match?(/^[A-Z]+$/)

    out = ""
    if is_yelling and is_question
      out = "Calm down, I know what I'm doing!"
    elsif is_yelling
      out = "Whoa, chill out!"
    elsif is_question
      out = "Sure."
    elsif is_silence
      out = "Fine. Be that way!"
    else
      out = "Whatever."
    end
    return out
  end
end
