
import Foundation

// MARK: - Protocols (Interfaces in UML)

// «interface» Identifiable
protocol Identifiable {
    var id: Int { get }
}

// «interface» Trackable
protocol Trackable {
    var location: String { get set }
}
