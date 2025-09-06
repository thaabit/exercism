class Queens
  attr_accessor :w, :b

  def initialize(white:nil, black:nil)
    raise ArgumentError unless !white || white.all? { |i| i.between?(0,7) }
    raise ArgumentError unless !black || black.all? { |i| i.between?(0,7) }
    @w = white
    @b = black
  end

  def attack?
    w[0] == b[0] || w[1] == b[1] || (w[1] - b[1]).abs == (w[0] - b[0]).abs
  end
end
