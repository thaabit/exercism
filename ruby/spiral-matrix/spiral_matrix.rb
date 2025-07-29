class SpiralMatrix
  def initialize(size)
    @size = size
  end

  def matrix
    x, y, dx, dy  = 0, 0, 1, 0
    _matrix = Array.new(@size){ Array.new(@size){nil} }
    (1..(@size ** 2)).each do |cnt|
      _matrix[y][x] = cnt
      next_off_board = x + dx < 0 || x + dx >= @size || y + dy < 0 || y + dy >= @size
      next_spot_taken = next_off_board ? true : !_matrix[y + dy][x + dx].nil?
      turn = next_off_board || next_spot_taken

      if turn
        if    dx == -1 then dx,dy =  0,-1 # left->up
        elsif dx ==  1 then dx,dy =  0, 1 # right->down
        elsif dy ==  1 then dx,dy = -1, 0 # down->left
        elsif dy == -1 then dx,dy =  1, 0 # up->right
        end
      end
      x += dx
      y += dy
    end
    _matrix
  end
end
