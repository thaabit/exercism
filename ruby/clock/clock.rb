class Clock
  attr_reader :hour, :minute
  def initialize(hour:0, minute:0)
    @hour = hour
    @minute = minute
    self.fixme
  end
  def fixme
    while @minute >= 60
      @hour += 1
      @minute -= 60
    end
    while @minute <= -60
      @hour -= 1
      @minute += 60
    end
    if @minute < 0
      @hour -= 1
      @minute = 60 + @minute
    end
    @hour = 24 + @hour if @hour < 0
    @hour = @hour % 24
  end

  def to_s
    @hour.to_s.rjust(2,'0') + ':' + @minute.to_s.rjust(2,'0')
  end

  def ==(obj)
    obj.hour == @hour && obj.minute == @minute
  end

  def +(obj)
    @hour += obj.hour
    @minute += obj.minute
    self.fixme
    return self
  end

  def -(obj)
    @hour -= obj.hour
    @minute -= obj.minute
    self.fixme
    return self
  end

end
puts Clock.new(hour: 72, minute: 8640).to_s
