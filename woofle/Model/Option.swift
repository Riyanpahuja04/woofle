import Foundation
import FirebaseFirestoreSwift

struct Option: Identifiable, Codable, Equatable {
    @DocumentID var id: String? = UUID().uuidString
    var brief: String
    var description: String
}
