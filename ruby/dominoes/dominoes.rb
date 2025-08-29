class Dominoes

  def self.chain?(dominoes)
    place([], dominoes)
  end

  def self.place(chain, unused)

    return (chain.empty? or chain[0][0] == chain[-1][1]) if unused.empty?

    cur_pip = chain.empty? ? nil : chain[-1][1]
    (0..unused.length - 1).any? { |i|
      [unused[i], unused[i].reverse].any? { |d|
        next if cur_pip and d[0] != cur_pip
        place(chain.dup.append(d), unused.dup.tap{|d| d.delete_at(i)})
      }
    }
  end
end
