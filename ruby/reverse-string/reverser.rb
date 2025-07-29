class Reverser
  def self.reverse(str)
    ((str.length - 1).downto(0).map { |idx| str[idx] }).join
  end
end
