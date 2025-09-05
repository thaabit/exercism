class Node
  attr_accessor :left, :right, :value
  def initialize(value, left, right)
    @value = value
    @left = left
    @right = right
  end
  def ==(other)
    value == other.value && left == other.left && right == other.right
  end
end

class Zipper
  attr_accessor :focus, :zipper
  def self.from_tree(tree)
    self.new(tree)
  end
  def initialize(tree, zipper=[])
    @focus = tree
    @zipper = zipper
  end

  def value;   focus.value         end
  def to_tree; zipper[0] || focus end

  def up;      !zipper.empty? ? Zipper.new(zipper.pop,  zipper)          : nil end
  def right;   focus.right    ? Zipper.new(focus.right, zipper << focus) : nil end
  def left;    focus.left     ? Zipper.new(focus.left,  zipper << focus) : nil end

  def set_left(node);  focus.left  = node; self end
  def set_right(node); focus.right = node; self end
  def set_value(val);  focus.value = val;  self end

  def ==(other)
    focus == other.focus && zipper == other.zipper
  end
end
