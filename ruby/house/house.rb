class House
  LINES = [
    ["", "horse and the hound and the horn"],
    ["belonged to", "farmer sowing his corn"],
    ["kept", "rooster that crowed in the morn"],
    ["woke", "priest all shaven and shorn"],
    ["married", "man all tattered and torn"],
    ["kissed", "maiden all forlorn"],
    ["milked", "cow with the crumpled horn"],
    ["tossed", "dog"],
    ["worried", "cat"],
    ["killed", "rat"],
    ["ate", "malt"],
    ["lay in", "house that Jack built."]
  ].reverse
  def self.recite
    LINES.map.with_index { |line, index|
      out = ["This is the " + line[1]]
      LINES[0..index - 1].reverse.each_with_index { |subline, idx2|
        out << "that #{subline[0]} the #{subline[1]}"
      } if index > 0
      out.join("\n")
    }.join("\n\n") + "\n"
  end
end
