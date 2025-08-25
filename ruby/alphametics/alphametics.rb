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
      if works?(puzzle.dup, perm, letters)
        return perm.each_with_index.each_with_object({}) { |(number, index), out|
          out[letters[index]] = number
        }
      end
    }
    return {}
  end

  def self.works?(puzzle, numbers, letters)
    numbers.each_with_index { |number, index|
      puzzle.gsub!(letters[index], number.to_s)
    }
    parts = puzzle.split(/\s+/)
    tally = 0
    parts.each_with_index { |part, i|
      if part.int?
        return false if part.size > 1 and part[0].to_i == 0
        tally += part.to_i
      elsif part == "=="
        total = parts[i + 1]
        return false if total.size > 1 and total[0].to_i == 0
        return (tally == total.to_i)
      end
    }
  end
end
