import Foundation

class TopItem: Codable {
    let id: UUID
    
    var name: String
    var score: Int
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
        self.id = UUID()
    }
}
