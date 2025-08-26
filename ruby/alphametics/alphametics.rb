class Alphametics
  def self.solve(puzzle)
    letters = puzzle.scan(/[A-Z]/).uniq
    firsts = puzzle.scan(/\b([A-Z])[A-Z]/).flatten.tally

    vars = puzzle.split(/\s*[+=]+\s*/)
    last_index = vars.length - 1
    var_hash = vars.each_with_object(Hash.new(0)).with_index { |(var, hash), var_idx|
      var.chars.reverse.each_with_index { |char, idx|
        if var_idx == last_index
          hash[char] -= 10**idx
        else
          hash[char] += 10**idx
        end
      }
    }
    multipliers = letters.map { |char, idx| var_hash[char] }
    no_zeroes = letters.map { |char, idx| firsts.key?(char) }

    (0..9).to_a.permutation(letters.size).lazy.each { |numbers|
      next if !numbers.each_index.select { |idx|
        numbers[idx] == 0 and no_zeroes[idx]
      }.empty?
      return letters.zip(numbers).to_h if numbers.each_index.inject(0) { |agg,idx|
        agg + numbers[idx] * multipliers[idx]
      }.zero?
    }
    return {}
  end
end
