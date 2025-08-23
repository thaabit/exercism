module ArmstrongNumbers
  def self.include?(number)
    len = number.to_s.length
    number == number.to_s.chars.map(&:to_i).reduce(0) { |sum, num| sum + num**len }
  end
end
