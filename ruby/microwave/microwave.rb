class Microwave
  attr_accessor :timer
  def initialize(digits)
    digits = digits.to_s.rjust(4, "0")
    seconds = digits[2..3].to_i
    mins = digits[0..1].to_i + seconds / 60
    seconds %= 60

    @timer = mins.to_s.rjust(2, "0") + ":" + seconds.to_s.rjust(2, "0")
  end
end
