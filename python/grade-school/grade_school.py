class School:

    def __init__(self):
        self.grades = {}
        self.added_list = []

    def add_student(self, name, grade):
        if grade not in self.grades: self.grades[grade] = set()
        for g, students in self.grades.items():
            if name in students:
                self.added_list.append(False)
                return False

        self.grades[grade].add(name)
        self.added_list.append(True)

    def roster(self):
        r = []
        for g in sorted(self.grades):
            for s in sorted(self.grades[g]):
                r.append(s)
        return r

    def grade(self, grade_number):
        return sorted(self.grades[grade_number]) if grade_number in self.grades else []

    def added(self):
        return self.added_list

school = School()
school.add_student(name="Blair", grade=2)
school.add_student(name="James", grade=2)
school.add_student(name="James", grade=3)
school.add_student(name="Paul", grade=3)
expected = ["Blair", "James"]
print(school.grade(2))
