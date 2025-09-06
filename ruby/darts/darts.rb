class Darts
  attr_accessor :score
  def initialize(x,y)
    dist = Math.sqrt(x**2 + y**2)
    @score = case
    when dist > 10 then 0
    when dist > 5  then 1
    when dist > 1  then 5
    else                10
    end
  end
end
