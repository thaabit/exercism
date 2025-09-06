class Board
  def initialize(board)
    @board = board.map { |row| row.gsub(' ','').chars }
  end

  def find_path(point, char, seen)
    return false if seen.include?(point)

    row, col = point[0], point[1]
    return false if row < 0 or col < 0
    return false if row >= @board.size or col >= @board[0].size

    return true if row == @board.size - 1

    seen << point

    [0,1,-1].permutation(2).each { |dir|
      new_row, new_col = row + dir[0],  col + dir[1]
      return true if @board[new_row][new_col] == char && find_path([new_row, new_col], char, seen)
    }
    return false
  end

  def winner?(char)
    @board[0].each_with_index { |stone, i|
        return true if stone == char && find_path([0, i], char, [])
    }
    return false
  end

  def winner
    ['O','X'].each { |char|
      return char if winner?(char)
      @board = @board.transpose
    }
    return ''
  end

end
