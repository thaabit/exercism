class Queens
  def initialize(white:, black:)
    raise ArgumentError unless white and black
    @white = white
    @black = black
  end
end
