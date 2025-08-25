class Proverb
  def initialize(*things, qualifier:nil)
    @things = things
    @qualifier = qualifier
  end

  def to_s
    @things.each_with_index.each_with_object([]) { |(thing, i), out|
      out << if i != @things.length - 1
               "For want of a #{@things[i]} the #{@things[i+1]} was lost."
             else
               "And all for the want of a #{@qualifier ? @qualifier + " " : ""}#{@things[0]}."
             end
    }.join("\n")
  end
end
