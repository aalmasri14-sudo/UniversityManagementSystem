
import Foundation

// MARK: - Demo (main)
let system = UniversitySystem.getInstance()

// 1) Create students
let sara = system.createStudent(name: "Sara Al-Ahmad", major: "Computer Science", gpa: 3.8)
let omar = system.createStudent(name: "Omar Khalid", major: "Software Engineering", gpa: 3.5)
let lina = system.createStudent(name: "Lina Haddad", major: "Data Science", gpa: 3.9)

// 2) Create professors
let drNoor = system.createProfessor(
    name: "Dr. Noor Hassan",
    speciality: "iOS Development",
    salary: 9500,
    location: "Building A - Lab 3"
)

let drSami = system.createProfessor(
    name: "Dr. Sami Yousef",
    speciality: "Databases",
    salary: 8800,
    location: "Building C - 210"
)

// 3) Create courses
let swiftCourse = system.createCourse(title: "Swift & iOS Programming", credits: 3)
let dbCourse = system.createCourse(title: "Database Systems", credits: 4)

// 4) Assign professors to courses
system.assign(professor: drNoor, to: swiftCourse)
system.assign(professor: drSami, to: dbCourse)

// 5) Enroll students
let e1 = system.enroll(student: sara, in: swiftCourse, semester: "Fall 2025")
_ = system.enroll(student: omar, in: swiftCourse, semester: "Fall 2025")
_ = system.enroll(student: lina, in: dbCourse, semester: "Fall 2025")
e1.assign(grade: "A")

// 6) Add assignments
let hw1 = system.addAssignment(
    to: swiftCourse,
    title: "OOP Concepts in Swift",
    dueDate: Date().addingTimeInterval(7 * 24 * 60 * 60)
)

// 7) Record submissions
_ = system.submit(fileName: "sara_oop.playground", for: hw1, by: sara)
_ = system.submit(fileName: "omar_oop.playground", for: hw1, by: omar)

// 8) Retrieve info
print(sara.describe())
print(drNoor.describe())

for course in system.courses {
    let professorName = course.professor?.name ?? "TBA"
    print("\n\(course.title) (\(course.credits) credits) - taught by \(professorName)")
    print("Enrolled students:")
    for student in course.enrolledStudents {
        print(" - \(student.name)")
    }
}

// Statistics
print("")
system.printStatistics()

// Singleton proof
let sameSystem = UniversitySystem.getInstance()
print("\nSame instance? \(system === sameSystem)")



