class CustomSet

  attr_reader :set

  def initialize(arr)
    @set = arr.uniq
  end

  def empty?
    @set.empty?
  end

  def member?(el)
    @set.include?(el)
  end

  def add(el)
    @set.append(el) unless member?(el)
    return self
  end

  def disjoint?(other)
    intersection(other).empty?
  end

  def subset?(other)
    @set.all? { |el| other.member?(el) }
  end

  def ==(other)
    other.subset?(self) and self.subset?(other)
  end

  def intersection(other)
    CustomSet.new(@set.select { |el| other.member?(el) })
  end

  def difference(other)
    CustomSet.new(@set.select { |el| !other.member?(el) })
  end

  def union(other)
    CustomSet.new(other.set + @set)
  end
end
