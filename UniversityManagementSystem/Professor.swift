import Foundation

// MARK: - Professor (inherits Person + implements Trackable)
class Professor: Person, Trackable {
    var speciality: String
    var salary: Double
    var location: String

    // Association: Professor teaches 1..* courses
    private(set) var courses: [Course] = []

    init(id: Int, name: String, speciality: String, salary: Double, location: String = "Main Campus") {
        self.speciality = speciality
        self.salary = salary
        self.location = location
        super.init(id: id, name: name)
    }

    func teach(_ course: Course) {
        if courses.contains(where: { $0.courseId == course.courseId }) { return }
        courses.append(course)
        course.professor = self
    }

    override func describe() -> String {
        return "Professor #\(id): \(name) - \(speciality) @ \(location)"
    }
}
