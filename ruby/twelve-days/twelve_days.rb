class TwelveDays
  PHRASE = "On the %s day of Christmas my true love gave to me: "
  VERSES = ['a Partridge in a Pear Tree.', 'two Turtle Doves', 'three French Hens', 'four Calling Birds', 'five Gold Rings', 'six Geese-a-Laying', 'seven Swans-a-Swimming', 'eight Maids-a-Milking', 'nine Ladies Dancing', 'ten Lords-a-Leaping', 'eleven Pipers Piping', 'twelve Drummers Drumming']
  COUNTERS = %w[first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth]
  def self.song
    song = PHRASE % [COUNTERS[0]] + VERSES[0] + "\n\n"
    former = ['and ' + VERSES[0]]
    (1..11).each do |idx|
      former.unshift(VERSES[idx])
      song += PHRASE % [COUNTERS[idx]] + former.join(', ')
      song += "\n\n" unless idx == 11
    end
    song + "\n"
  end
end
