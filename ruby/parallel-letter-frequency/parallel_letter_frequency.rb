class ParallelLetterFrequency
  def self.count(texts)
    threads = []
    texts.each { |text|
      threads << Thread.new {
        text.gsub(/[^\p{Alpha}]/,'').downcase.chars.tally
      }
    }
    threads.each_with_object(Hash.new(0)) { |t, out|
      t.value.each { |k,v|
        out[k] += v
      }
    }
  end
end
