import Foundation

// MARK: - Course
class Course {
    let courseId: Int
    var title: String
    var credits: Int

    // Association: course is taught by professor
    weak var professor: Professor?

    // Association with Enrollment
    private(set) var enrollments: [Enrollment] = []

    // Aggregation: course has assignments
    private(set) var assignments: [Assignment] = []

    init(courseId: Int, title: String, credits: Int) {
        self.courseId = courseId
        self.title = title
        self.credits = credits
    }

    func add(enrollment: Enrollment) {
        enrollments.append(enrollment)
    }

    func add(assignment: Assignment) {
        assignments.append(assignment)
    }

    var enrolledStudents: [Student] {
        return enrollments.compactMap { $0.student }
    }
}
