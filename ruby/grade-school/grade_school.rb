class School
  def initialize
    @students = {}
  end

  def add(student, grade)
    return false if @students.has_key?(student)
    @students[student] = grade
    true
  end

  def grade(grade)
    @students.select { |n, g| grade == g }.keys.sort
  end

  def roster
    @students.sort_by { |k,v| [v, k] }.map { |a| a[0] }
  end
end
