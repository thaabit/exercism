class Dominoes

  def self.chain?(dominoes)
    dominoes.permutation(dominoes.length).any? { |p|
      puts p.inspect
      (p[0][0] == p[-1][1]) and p.join[1..-2].chars.each_slice(2).all? { |(p1,p2)| puts [p1,p2].inspect; p1 == p2 }
    }
  end
end
puts Dominoes.chain?([[1, 2], [2, 3], [3, 1], [2, 4], [2, 4]]).inspect
