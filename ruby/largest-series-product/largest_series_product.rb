class Series
  def initialize(sequence)
    @sequence = sequence
  end
  def largest_product(len)
    raise ArgumentError if len < 1 or len > @sequence.length
    raise ArgumentError unless @sequence.match?(/^[0-9]+$/)
    @sequence.chars.map(&:to_i).each_cons(len).map { |slice|
      slice.inject(:*)
    }.max
  end
end
