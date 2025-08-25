class String
  def int?
    self.to_i.to_s == self
  end
end

class Alphametics
  def self.solve(puzzle)
    letters = puzzle.dup.gsub(/[\W\s]/,'').chars.uniq
    perms = (0..9).to_a.permutation(letters.size)
    perms.each { |perm|
      return letters.zip(perm).to_h if works?(puzzle.dup, perm, letters)
    }
    return {}
  end

  def self.works?(puzzle, numbers, letters)
    numbers.each_with_index { |number, index|
      puzzle.gsub!(letters[index], number.to_s)
    }
    return false if puzzle.match?(/(^|\s)0\d/)
    parts = puzzle.split(/\s[=+]+\s/).map(&:to_i)
    return parts.pop.to_i == parts.sum
  end
end
