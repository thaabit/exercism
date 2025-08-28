class Simulator
  MAP = {A: :advance, L: :turn_left, R: :turn_right}.freeze

  def place(robot, x:, y:, direction:)
    robot.at(x,y)
    robot.orient(direction)
  end

  def instructions(input); input.chars.map { |c| MAP[c.to_sym] } end
  def evaluate(robot, input); instructions(input).each { |i| robot.send(i) } end

end

class Robot
  DIRS = %i[north east south west].freeze
  MOVES = DIRS.zip([ [0,1], [1,0], [0,-1], [-1,0] ]).to_h.freeze

  attr_reader :coordinates, :bearing

  def at(x, y); @coordinates = [x, y] end
  def advance; (0..1).each { |i| @coordinates[i] += MOVES[@bearing][i] } end

  def orient(dir)
    raise ArgumentError unless DIRS.include? dir
    @bearing = dir
  end

  def turn(dir); @bearing = DIRS[(DIRS.index(@bearing) + dir) % 4] end
  def turn_right; turn(1) end
  def turn_left; turn(-1) end
end
