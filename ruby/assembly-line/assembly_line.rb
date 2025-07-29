class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    rate = (221 * @speed).to_f
    if @speed == 10
      rate *= 0.77
    elsif @speed == 9
      rate *= 0.8
    elsif @speed >= 5
      rate *= 0.9
    end
    return rate
  end

  def working_items_per_minute
    (self.production_rate_per_hour / 60).floor
  end
end
