class BottleSong
  NUMS= %w[No One Two Three Four Five Six Seven Eight Nine Ten]
  def self.recite(start, count)
    ((start - count + 1)..start).to_a.reverse.map { |i|
      num = NUMS[i]
      plural = i > 1 ? 's' : ''
      <<~TEXT
      #{num} green bottle#{plural} hanging on the wall,
      #{num} green bottle#{plural} hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be #{NUMS[i-1].downcase} green bottle#{i == 2 ? '' : 's'} hanging on the wall.
      TEXT
    }.join("\n")
  end
end
