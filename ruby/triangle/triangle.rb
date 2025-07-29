class Triangle
  def initialize(sides)
    @sides = sides
  end
  def triangle?
    @sides.each {|s| return false if s == 0 }
    (@sides[0] + @sides[1]) >= @sides[2] &&
    (@sides[0] + @sides[2]) >= @sides[1] &&
    (@sides[1] + @sides[2]) >= @sides[0]
  end

  def equilateral?
    triangle? and (@sides.uniq.size == 1)
  end
  def isosceles?
    triangle? and (@sides.uniq.size < 3)
  end
  def scalene?
    triangle? and (@sides.uniq.size == 3)
  end
end
