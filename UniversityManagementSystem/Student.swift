
import Foundation

// MARK: - Student (inherits from Person)
class Student: Person {
    var major: String
    var gpa: Double

    // Association: Student has 0..* Enrollments
    private(set) var enrollments: [Enrollment] = []

    init(id: Int, name: String, major: String, gpa: Double) {
        self.major = major
        self.gpa = gpa
        super.init(id: id, name: name)
    }

    func add(enrollment: Enrollment) {
        enrollments.append(enrollment)
    }

    var enrolledCourses: [Course] {
        return enrollments.compactMap { $0.course }
    }

    override func describe() -> String {
        return "Student #\(id): \(name) - \(major) (GPA: \(gpa))"
    }
}
