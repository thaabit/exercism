class HighScores
  def initialize(scores)
    @scores = scores
  end

  def scores
    @scores
  end

  def latest
    @scores[-1]
  end

  def personal_best
    @scores.max
  end

  def latest_is_personal_best?
    self.personal_best == self.latest
  end

  def personal_top_three
    s = @scores.clone
    three = []
    (1..3).each {
      if s.empty? then next end
      three << s.max
      s.delete_at(s.index(s.max))
    }
    return three
  end


end
