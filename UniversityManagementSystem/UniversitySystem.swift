
import Foundation

// MARK: - UniversitySystem (Singleton)
final class UniversitySystem {

    // Singleton instance
    private static let instance = UniversitySystem()

    static func getInstance() -> UniversitySystem {
        return instance
    }

    // Private init prevents creating objects from outside
    private init() {}

    // Managed data
    private(set) var students: [Student] = []
    private(set) var professors: [Professor] = []
    private(set) var courses: [Course] = []

    // ID counters
    private var nextStudentId = 1
    private var nextProfessorId = 100
    private var nextCourseId = 1000
    private var nextEnrollmentId = 1
    private var nextAssignmentId = 1

    // MARK: - Create Operations

    @discardableResult
    func createStudent(name: String, major: String, gpa: Double) -> Student {
        let student = Student(id: nextStudentId, name: name, major: major, gpa: gpa)
        nextStudentId += 1
        students.append(student)
        return student
    }

    @discardableResult
    func createProfessor(name: String, speciality: String, salary: Double, location: String) -> Professor {
        let professor = Professor(
            id: nextProfessorId,
            name: name,
            speciality: speciality,
            salary: salary,
            location: location
        )
        nextProfessorId += 1
        professors.append(professor)
        return professor
    }

    @discardableResult
    func createCourse(title: String, credits: Int) -> Course {
        let course = Course(courseId: nextCourseId, title: title, credits: credits)
        nextCourseId += 1
        courses.append(course)
        return course
    }

    // MARK: - Academic Operations

    @discardableResult
    func enroll(student: Student, in course: Course, semester: String) -> Enrollment {
        let enrollment = Enrollment(
            enrollmentId: nextEnrollmentId,
            student: student,
            course: course,
            semester: semester
        )
        nextEnrollmentId += 1

        student.add(enrollment: enrollment)
        course.add(enrollment: enrollment)

        return enrollment
    }

    func assign(professor: Professor, to course: Course) {
        professor.teach(course)
    }

    @discardableResult
    func addAssignment(to course: Course, title: String, dueDate: Date) -> Assignment {
        let assignment = Assignment(id: nextAssignmentId, title: title, dueDate: dueDate)
        nextAssignmentId += 1
        course.add(assignment: assignment)
        return assignment
    }

    @discardableResult
    func submit(fileName: String, for assignment: Assignment, by student: Student) -> Submission {
        return assignment.recordSubmission(fileName: fileName, by: student)
    }

    // MARK: - Queries / Statistics

    func findStudent(byId id: Int) -> Student? {
        return students.first { $0.id == id }
    }

    func findCourse(byId id: Int) -> Course? {
        return courses.first { $0.courseId == id }
    }

    func averageGPA() -> Double {
        guard !students.isEmpty else { return 0.0 }
        let total = students.reduce(0.0) { $0 + $1.gpa }
        return total / Double(students.count)
    }

    func totalPayroll() -> Double {
        return professors.reduce(0.0) { $0 + $1.salary }
    }

    func totalSubmissions() -> Int {
        return courses
            .flatMap { $0.assignments }
            .reduce(0) { $0 + $1.submissions.count }
    }

    func printStatistics() {
        print("===== University Statistics =====")
        print("Students: \(students.count)")
        print("Professors: \(professors.count)")
        print("Courses: \(courses.count)")
        print("Submissions: \(totalSubmissions())")
        print(String(format: "Average GPA: %.2f", averageGPA()))
        print(String(format: "Payroll: $%.2f", totalPayroll()))
    }
}
