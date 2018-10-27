import Foundation

class Item {
    let type: String
    let descendants: Int
    let time: String
    let kids: [Int]
    
    init(descendants: Int, kids: [Int], time: String, type: String) {
        self.descendants = descendants
        self.kids = kids
        self.time = time
        self.type = type
    }
}
