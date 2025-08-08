module Chess
  RANKS = 1..8
  FILES = 'A'..'H'

  def self.valid_square?(rank, file)
    RANKS.include?(rank.to_i) && FILES.include?(file)
  end

  def self.nick_name(first_name, last_name)
    first_name[0..1].upcase + last_name[-2..-1].upcase
  end

  def self.move_message(first_name, last_name, square)
    nickname = self.nick_name(first_name, last_name)
    if self.valid_square?(square[1], square[0])
      return "#{nickname} moved to #{square}"
    end
    return "#{nickname} attempted to move to #{square}, but that is not a valid square"
  end
end
