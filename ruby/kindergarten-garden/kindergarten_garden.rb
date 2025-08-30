class Garden
  STUDENTS = %i[alice bob charlie david eve fred ginny harriet ileana joseph kincaid larry]
  PLANTS = {
    :V => :violets,
    :C => :clover,
    :G => :grass,
    :R => :radishes,
  }

  def initialize(garden)
    @garden = garden.split("\n")
  end

  def method_missing(method)
    start = STUDENTS.index(method) * 2
    (0..1).each_with_object([]) { |row, out|
      (start..(start + 1)).each { |col|
        out << PLANTS[@garden[row][col].to_sym]
      }
    }
  end
end
