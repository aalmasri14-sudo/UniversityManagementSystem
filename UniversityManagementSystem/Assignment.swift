
import Foundation

// MARK: - Assignment
class Assignment {
    let id: Int
    var title: String
    var dueDate: Date

    // Composition: Assignment owns Submissions
    private(set) var submissions: [Submission] = []

    init(id: Int, title: String, dueDate: Date) {
        self.id = id
        self.title = title
        self.dueDate = dueDate
    }

    @discardableResult
    func recordSubmission(fileName: String, by student: Student) -> Submission {
        let submission = Submission(
            id: submissions.count + 1,
            fileName: fileName,
            submittedAt: Date(),
            student: student
        )
        submissions.append(submission)
        return submission
    }

    var isOverdue: Bool {
        return Date() > dueDate
    }
}

// MARK: - Submission (Composition Part)
class Submission {
    let id: Int
    let fileName: String
    let submittedAt: Date

    weak var student: Student?

    // fileprivate: only Assignment in this file can create Submission
    fileprivate init(id: Int, fileName: String, submittedAt: Date, student: Student) {
        self.id = id
        self.fileName = fileName
        self.submittedAt = submittedAt
        self.student = student
    }
}
