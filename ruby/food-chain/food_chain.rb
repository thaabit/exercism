class FoodChain
  ANIMALS = {
    "fly"    => "I don't know why she swallowed the fly. Perhaps she'll die.",
    "spider" => "It wriggled and jiggled and tickled inside her.",
    "bird"   => "How absurd to swallow a bird!",
    "cat"    => "Imagine that, to swallow a cat!",
    "dog"    => "What a hog, to swallow a dog!",
    "goat"   => "Just opened her throat and swallowed a goat!",
    "cow"    => "I don't know how she swallowed a cow!",
    "horse"  => "She's dead, of course!",
  }
  def self.song
    ANIMALS.map.with_index { |(animal, extra), i|
      verse = []
      verse << "I know an old lady who swallowed a #{animal}."
      verse << extra
      if animal != "horse"
        ANIMALS.keys[0..i].reverse.each_cons(2) { |first, second|
          line = "She swallowed the #{first} to catch the #{second}"
          line += second == "spider" ? ANIMALS["spider"].sub("It"," that") : "."
          verse << line
        }
        verse << ANIMALS["fly"] unless animal == 'fly'
      end
      verse.join("\n")
    }.join("\n\n") + "\n"
  end
end
