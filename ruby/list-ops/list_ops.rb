class ListOps
  def self.arrays(array); array.length end
  def self.reverser(array); array.reverse end
  def self.concatter(lhs, rhs); lhs + rhs end
  def self.mapper(array, &func); array.each_with_object([]) { |e, out| out << func.call(e) } end
  def self.filterer(array, &func); array.each_with_object([]) { |e,out| out << e if func.call(e) } end
  def self.sum_reducer(array); array.sum end
  def self.factorial_reducer(array); array.reduce(1) { |e, agg| agg * e } end
end
