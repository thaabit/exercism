require 'date'

DAYS = %i[sunday monday tuesday wednesday thursday friday saturday]
OFFSETS = {:first => 1, :second => 8, :teenth => 13, :third => 15, :fourth => 22, :last => 22}

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(dayname, weektype)
    d = Date.new(@year, @month, OFFSETS[weektype])
    d += 1 while d.wday != DAYS.index(dayname)
    (weektype == :last and (d + 7).month == d.month) ? d + 7 : d
  end
end
