class Grep
  def self.grep(pattern, flags, files)
    flags = flags.map{ |f| f[1].to_sym }.zip(flags.map { 1 }).to_h

    pattern = "^" + pattern + "$" if flags[:x]
    pattern = /#{pattern}/i       if flags[:i]

    out = []
    files.each { |f|
      File.read(f).split("\n").each_with_index { |line, i|
        if line.match?(pattern) ^ flags[:v]
          if flags[:l]
            out << f
            break
          end
          line = "#{(i + 1)}:" + line if flags[:n]
          line = "#{f}:" + line if files.size > 1
          out << line
        end
      }
    }
    out.join("\n")
  end
end
