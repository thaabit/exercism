class Alphametics
  def self.solve(puzzle)
    letters = puzzle.scan(/[A-Z]/).uniq
    firsts = puzzle.scan(/\b([A-Z])[A-Z]/).flatten.tally
    perms = (0..9).to_a.permutation(letters.size)

    perms.each { |perm|
      return letters.zip(perm).to_h if works?(puzzle, perm, letters, firsts)
    }
    return {}
  end

  def self.works?(puzzle, numbers, letters, firsts)
    dup = puzzle.dup
    letters.zip(numbers).each { |(letter,number)|
      return false if number == 0 and firsts.key?(letter)
      dup.gsub!(letter, number.to_s)
    }
    parts = dup.split(/\s[=+]+\s/).map(&:to_i)
    return parts.pop.to_i == parts.sum
  end
end
