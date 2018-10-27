import Foundation

class ViewModel: NSObject {
    
    var items: [String: Any] = [:]
    var itemList: [String] {
        return items["kids"] as? [String] ?? []
    }
    
    func get() {
        NetworkClient.shared.getItems { (status, response) in
            print("--------->>>> Status: \(status) =======>>> data: \(response)")
            self.items = response as! [String: Any]
        }
    }
}
