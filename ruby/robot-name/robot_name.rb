class Robot

  attr_reader :name

  def initialize
    reset
  end

  def reset
    @name = @@possibles.pop
  end

  def self.forget
    @@possibles = ('AA000'..'ZZ999').to_a.shuffle
  end
end
