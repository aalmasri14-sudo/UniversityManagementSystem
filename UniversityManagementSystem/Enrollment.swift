
import Foundation

// MARK: - Enrollment (Association Class)
class Enrollment {
    let enrollmentId: Int
    let semester: String
    private(set) var grade: String

    // Weak to avoid retain cycles
    weak var student: Student?
    weak var course: Course?

    init(enrollmentId: Int, student: Student, course: Course, semester: String, grade: String = "-") {
        self.enrollmentId = enrollmentId
        self.student = student
        self.course = course
        self.semester = semester
        self.grade = grade
    }

    func assign(grade: String) {
        self.grade = grade
    }
}
