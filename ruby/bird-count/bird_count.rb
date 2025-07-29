class BirdCount
  def self.last_week
    @last_week
  end

  def initialize(birds_per_day)
    @last_week = birds_per_day
  end

  def yesterday
    @last_week[-1]
  end

  def total
    @last_week.sum
  end

  def busy_days
    @last_week.count { |n| n >= 5 }
  end

  def day_without_birds?
    @last_week.any? { |n| n == 0 }
  end
end
