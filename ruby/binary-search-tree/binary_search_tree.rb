class Bst
  attr_reader :data, :left, :right
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def insert(data)
    if data <= @data
      if @left.nil?
        @left = Bst.new(data)
      else
        @left.insert(data)
      end
    else
      if @right.nil?
        @right = Bst.new(data)
      else
        @right.insert(data)
      end
    end
  end

  def each(&block)
    return to_enum unless block_given?
    @left.each(&block) if @left
    yield @data
    @right.each(&block) if @right
  end
end
