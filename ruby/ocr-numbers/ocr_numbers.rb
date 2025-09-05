class OcrNumbers
 NUMBERS = {
    " _ | ||_|": 0,
    "     |  |": 1,
    " _  _||_ ": 2,
    " _  _| _|": 3,
    "   |_|  |": 4,
    " _ |_  _|": 5,
    " _ |_ |_|": 6,
    " _   |  |": 7,
    " _ |_||_|": 8,
    " _ |_| _|": 9,
 }.default = '?'
 def self.convert(input)
   input = input.split("\n")
   raise ArgumentError if input.length    % 4 != 0
   raise ArgumentError if input[0].length % 3 != 0
   input.each_slice(4).map { |line|
     (0..(line[0].length) - 3).step(3).map { |start|
       key = (0..2).map { |i| line[i][start..(start + 2)] }.join.to_sym
       NUMBERS[key] || '?'
     }
   }.map(&:join).join(",")
 end
end
