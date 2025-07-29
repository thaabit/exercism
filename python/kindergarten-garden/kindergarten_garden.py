default_students = ["Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"]
plant_map = {
    "C": "Clover",
    "G": "Grass",
    "R": "Radishes",
    "V": "Violets",
}

class Garden:
    def __init__(self, diagram, students=default_students):
        self.students = sorted(students)
        self.rows = [list(line) for line in diagram.split("\n")]

    def plants(self, name):
        index = self.students.index(name) * 2
        plants = []
        for r in self.rows:
            plants.extend([plant_map[plant] for plant in r[index:index+2]])
        return plants
