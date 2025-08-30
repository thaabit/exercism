class Series
  def initialize(sequence)
    @sequence = sequence
  end
  def largest_product(len)
    raise ArgumentError if len < 1 or len > @sequence.length
    raise ArgumentError unless @sequence.match?(/^[0-9]+$/)
    (0..@sequence.length - len).map { |start|
      @sequence[start..].chars.map(&:to_i).each_slice(len).map { |slice|
        next 0 if slice.size < len
        slice.inject(:*)
      }.max
    }.max
  end
end
