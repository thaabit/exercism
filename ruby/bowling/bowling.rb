class Game
  LAST_FRAME = 9

  def initialize
    @open_frame = nil
    @bonus = Array.new(0)
    @frames = []
  end

  def score
    raise BowlingError unless game_complete?
    (0..LAST_FRAME).map { |i|
      frame_score(i)
    }.sum
  end

  def game_complete?
    return false if @frames.size < 10

    last_is_strike = strike?(@frames[LAST_FRAME])
    last_is_spare  = spare?( @frames[LAST_FRAME])
    return true unless last_is_strike or last_is_spare
    return true if last_is_strike and @bonus.size == 2
    return true if last_is_spare  and @bonus.size == 1

    return false
  end

  def frame_score(i)
    raise BowlingError unless game_complete?

    frame = @frames[i]
    score = frame.sum
    if i == LAST_FRAME
      score += @bonus.sum
    elsif strike?(frame)
      next_frame = @frames[i+1]
      score += next_frame.sum
      score += (i == 8 ? @bonus[0] : @frames[i+2][0]) if strike?(next_frame)
    elsif spare?(frame)
      score += @frames[i+1][0]
    end
    score
  end

  def roll(pins)
    raise BowlingError unless pins.between?(0,10)
    raise BowlingError if game_complete?

    if @open_frame
      raise BowlingError if @open_frame + pins > 10
      @frames << [@open_frame, pins]
      @open_frame = nil
    elsif @frames.size == 10
      b1 = @bonus[0]
      raise BowlingError if b1 and b1 != 10 and b1 + pins > 10
      @bonus << pins
    elsif pins == 10
      @frames << [pins, 0]
    else
      @open_frame = pins
    end
  end

  def strike?(frame)
    frame == [10, 0]
  end

  def spare?(frame)
    !strike?(frame) && frame.sum == 10
  end

  class BowlingError < StandardError; end
end
