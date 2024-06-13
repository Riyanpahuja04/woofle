import Foundation
import FirebaseFirestoreSwift

struct Goal: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var goal: String
    var levels: [Level]? = []
}
