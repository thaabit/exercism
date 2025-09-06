class Triangle
  def initialize(size)
    @size = size
  end

  def rows
    (1..@size).map.with_object([]) { |y, lines|
      lines << (1..y).map { |x|
        ((x == 1 or x == y) ? 1 : lines[y-2][x-1] + lines[y-2][x-2])
      }
    }
  end
end
