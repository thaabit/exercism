class Board
  def initialize(board)
    @board = board.map { |row| row.gsub(' ','').chars }
  end

  def find_path(row, col, stone, seen)
    return false if seen.include?([row, col])
    return false if @board[row][col] != stone

    return false if row < 0 or col < 0
    return false if row >= @board.size or col >= @board[0].size

    return true if row == @board.size - 1

    seen << [row, col]

    [0,1,-1].permutation(2).each { |dir|
      return true if find_path(row + dir[0], col + dir[1], stone, seen)
    }
    return false
  end

  def winner?(stone)
    @board[0].size.times { |i|
      return true if find_path(0, i, stone, [])
    }
    return false
  end

  def winner
    ['O','X'].each { |stone|
      return stone if winner?(stone)
      @board = @board.transpose
    }
    return ''
  end
end
