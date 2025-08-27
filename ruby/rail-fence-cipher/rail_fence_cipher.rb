class RailFenceCipher
  def self.encode(string, rail_count)
    cur_rail = 0
    forward = true
    string.chars.each_with_object(Array.new(rail_count, "")) { |char, rails|
      puts [char, cur_rail].inspect
      rails[cur_rail] += char
      forward = false if  forward and cur_rail + 1 >= rail_count
      forward = true  if !forward and cur_rail == 0
      cur_rail += forward ? 1 : -1
    }.join
  end

  def self.decode(string, rail_count)
    cycle = 2 + ((rail_count - 2) * 2)
    (1..


  end
end
puts RailFenceCipher.encode('WEAREDISCOVEREDFLEEATONCE', 3).inspect
