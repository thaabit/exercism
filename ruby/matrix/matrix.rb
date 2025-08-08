class Matrix
  def initialize(input)
    matrix = []
    input.split("\n").map { |row| matrix << row.split(" ").map(&:to_i) }
    @matrix = matrix
  end

  def row(idx)
    @matrix[idx - 1]
  end

  def column(idx)
    @matrix.map { |row| row[idx - 1]}
  end
end
