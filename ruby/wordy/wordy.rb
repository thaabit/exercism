class WordProblem
  def initialize(input)
    @input = input
  end
  def answer
    parts = @input.sub("What is ", "").sub(/\?$/,'').gsub(" by","").split(" ")
    answer = parts.shift.to_i
    parts.each_slice(2).each { |part|
      raise ArgumentError if part.length != 2
      op, d = part[0].to_sym, part[1].to_i
      case op
        when :plus;       answer += d
        when :minus;      answer -= d
        when :multiplied; answer *= d
        when :divided;    answer /= d
        else raise ArgumentError
      end
    }
    return answer
  end
end
