class Node
  attr_accessor :children
  def initialize(value,*children)
    @value = value
    @children = children
    p @children
  end
end

class Zipper
  def self.from_tree(tree)
    @tree = tree
    @focuse = tree.children[0]
  end

  def prev
    
  end
end
