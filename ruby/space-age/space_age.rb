class SpaceAge
  SECONDS_IN_YEAR = 60 * 60 * 24 * 365.25
  def initialize(seconds) @seconds = seconds                 end
  def on_earth()   @seconds /  SECONDS_IN_YEAR               end
  def on_mercury() @seconds / (SECONDS_IN_YEAR * 0.2408467)  end
  def on_venus()   @seconds / (SECONDS_IN_YEAR * 0.61519726) end
  def on_mars()    @seconds / (SECONDS_IN_YEAR * 1.8808158)  end
  def on_jupiter() @seconds / (SECONDS_IN_YEAR * 11.862615)  end
  def on_saturn()  @seconds / (SECONDS_IN_YEAR * 29.447498)  end
  def on_uranus()  @seconds / (SECONDS_IN_YEAR * 84.016846)  end
  def on_neptune() @seconds / (SECONDS_IN_YEAR * 164.79132)  end
end
