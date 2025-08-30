class CircularBuffer
  def initialize(size)
    @buffer = []
    @size = size
  end

  def read
    raise BufferEmptyException if @buffer.empty?
    @buffer.shift
  end

  def write(value)
    raise BufferFullException if @buffer.size == @size
    @buffer.append(value)
  end

  def write!(value)
    @buffer.shift if @buffer.size == @size
    @buffer.append(value)
  end

  def clear
    @buffer = []
  end

  class BufferFullException < StandardError; end
  class BufferEmptyException < StandardError; end
end
