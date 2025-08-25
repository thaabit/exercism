class String
  def int?
    self.to_i.to_s == self
  end
end

class Alphametics
  def self.solve(puzzle)
    tried = {}
    found = nil
    permutations = ->(letters, numbers, opt) {
      if letters.size == 0
        key = opt.sort.map { |k,v| k + v.to_s }.join
#        puts key
        if not tried.key?(key) and works(puzzle.dup, opt)
          puts "Found"
          found = opt
        end
        tried[key] = 1
      end
      if not found
        letters.each { |letter|
          numbers.each { |number|
            opt[letter] = number
            permutations.call(letters.reject { |l| l == letter }, numbers.reject { |n| n == number }, opt.dup)
          }
        }
      end
    }
    letters = puzzle.dup.gsub(/[\W\s]/,'').chars.uniq
    numbers = Array(0..9)
    permutations.call(letters, numbers, {})
    return found || {}
  end

  def self.works(puzzle, opt)
    opt.each { |k,v|
      puzzle.gsub!(k, v.to_s)
    }
    parts = puzzle.split(/\s+/)
    total = 0
    parts.each_with_index { |part, i|
      if part.int?
        total += part.to_i
      elsif part == "=="
        return (total == parts[i + 1].to_i)
      end
    }
  end
end
puts Alphametics.solve('HE + SEES + THE == LIGHT')
#puts Alphametics.solve('A + B == C')
