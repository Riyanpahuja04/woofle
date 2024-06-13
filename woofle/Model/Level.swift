import Foundation
import FirebaseFirestoreSwift

struct Level: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var level: Int
    var task: String
    var options: [Option]? = []
}
