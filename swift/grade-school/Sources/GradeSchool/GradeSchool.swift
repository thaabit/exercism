class GradeSchool {
    var grades : [Int:[String]] = [:]
    var students: Set<String> = []
    init(){}
    func addStudent(_ name:String, grade:Int) -> Bool {
        if students.contains(name) {
            return false
        }
        if grades[grade] == nil {
            grades[grade] = []
        }
        grades[grade]! += [name]
        students.insert(name)
        return true
    }
    func roster() -> [String] {
        var out : [String] = []
        for g in grades.keys.sorted() {
            out += studentsInGrade(g)
        }
        return out
    }

    func studentsInGrade(_ grade: Int) -> [String] {
        if let g = grades[grade] {
            return Array(g).sorted()
        } else {
            return []
        }
    }
}
