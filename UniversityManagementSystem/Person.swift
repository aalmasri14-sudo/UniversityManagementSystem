
import Foundation

// MARK: - Base Class
class Person: Identifiable {
    let id: Int
    var name: String

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }

    // Polymorphic method to be overridden by subclasses
    func describe() -> String {
        return "Person #\(id): \(name)"
    }
}
