# null char as a placeholder for spaces
NPC = '\x00'
RNPC = Regexp.escape(NPC)

class Transpose
  def self.transpose(input)
    return '' if input == ''
    lines = input.split("\n").map { |line| line.split('') }
    max = lines.map(&:size).max
    out = Array.new(max, '')
    lines.each { |line|
      (0...max).each { |idx|
        out[idx] += (line[idx] || NPC)
      }
    }
    return out.map { |line|
      line.sub(/[#{RNPC}]*$/,'').gsub(/#{RNPC}/,' ')
    }.join("\n")
  end
end
