class RailFenceCipher
  def self.encode(string, rail_count)
    return string if rail_count == 1
    cur_rail = 0
    forward = true
    string.chars.each_with_object(Array.new(rail_count, "")) { |char, rails|
      rails[cur_rail] += char
      forward = false if  forward and cur_rail + 1 >= rail_count
      forward = true  if !forward and cur_rail == 0
      cur_rail += forward ? 1 : -1
    }.join
  end

  def self.decode(string, rails)
    ((0..rails - 1).to_a + (1..rails - 2).to_a.reverse)
      .cycle
      .first(string.length)
      .zip(0..string.length)
      .sort
      .zip(string.chars)
      .sort_by { |a| a[0][1] }
      .map     { |a| a[1]    }
      .join
  end
end
