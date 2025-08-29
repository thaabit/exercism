class Robot
  @@used_names = {}
  @@possibles = nil

  def self.next
    if not @@possibles
      @@possibles = ('A'..'Z').to_a.repeated_permutation(2).each_with_object([]) { |chars, poss|
        (0..9).to_a.map(&:to_s).repeated_permutation(3).each { |nums|
          poss << chars.join + nums.join
        }
      }
    end
    @@possibles.pop
  end

  def name
    return @name if @name
    @name = Robot.next
  end

  def reset
    @name = nil
  end

  def self.forget
    @@possibles = nil
  end
end
