class ListOps
  def self.arrays(array); array.length end
  def self.reverser(array); array.reverse end
  def self.concatter(lhs, rhs); lhs + rhs end
  def self.mapper(array, func); array.map(&:func) end
  def self.filterer(array, func); array.select(&:func) end
  def self.sum_reducer(array); array.sum end
  def self.factorial_reducer(array); array.reduce(1) { |e, agg| agg * e } end


  
end
puts ListOps.filterer([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], &:odd?)
