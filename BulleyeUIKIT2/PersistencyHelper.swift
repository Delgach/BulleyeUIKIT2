import Foundation

class PersistencyHelper {
    static func getPath() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return path[0].appendingPathComponent("TopScores.plist")
    }
    
    static func load() -> [TopItem] {
        if let data = try? Data(contentsOf: getPath()){
            let decoder = PropertyListDecoder()
            
            do {
                return try decoder.decode([TopItem].self, from: data)
                
            } catch {
                print("ops, couldn't load data \(error.localizedDescription)")
            }
        }
        return [TopItem]()
    }
    
    static func save(list: [TopItem]) {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(list)
            try data.write(to: getPath(), options: Data.WritingOptions.atomic)
        } catch {
            print("ops, couldn't save data \(error.localizedDescription)")
        }
    }
}
