class SecretHandshake
  COMMANDS = ["wink", "double blink", "close your eyes", "jump"]

  def initialize(number)
    @number = number
  end

  def commands
    return [] unless @number.to_s.to_i == @number
    reverse = false
    out = @number.to_s(2).chars.reverse.each_with_object([]).with_index { |(i,out), idx|
      if i == "1"
        reverse = true if idx == 4
        out << COMMANDS[idx] if idx < 4
      end
    }
    reverse ? out.reverse : out
  end
end
