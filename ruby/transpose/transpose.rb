class Transpose
  def self.transpose(input)
    return '' if input == ''
    lines = input.split("\n").map { |line| line.split('') }
    max = lines.map(&:size).max
    out = Array.new(max, "")
    lines.each { |line|
      (0...max).each { |idx|
        out[idx] += (line[idx] || "|")
      }
    }
    return out.map { |line|
      line.sub(/\|+$/,"").gsub(/\|/," ")
    }.join("\n")
  end
end
