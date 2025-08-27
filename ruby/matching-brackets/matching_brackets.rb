class Brackets
  @left = "[{(".chars
  @right = "]})".chars
  @pairs = @left.zip(@right).to_h

  def self.paired?(string)
    string.chars.each_with_object([]) { |char, stack|
      if @left.include?(char)
          stack.push(char)
      elsif @right.include?(char)
        return false if stack.empty?
        return false if @pairs[stack.pop] != char
      end
    }.empty?
  end
end
