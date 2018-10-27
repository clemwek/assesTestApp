import Foundation

class NetworkClient {
    static var shared = NetworkClient()
    let baseURL: URL = URL(string:  "https://hacker-news.firebaseio.com/v0/item")!
    
    private init() {
        
    }
    
    func getItems(itemId: Int = 8863, completion: @escaping (_ status: Bool, _ items: Any?) -> ()) {
        //This should get items from the API
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let relativeURL = baseURL.appendingPathComponent("/\(itemId).json")
        guard
            let url = URLComponents(url: relativeURL, resolvingAgainstBaseURL: true)?.url
            else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = session.dataTask(with: request) { data, response, error in
            guard
                error == nil,
                let responseData = data
                else { return completion(false, nil) }
            
            do {
                guard
                    let formattedData = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any]
                    else {
                        completion(false, nil)
                        print("Error trying to convert data to json")
                        return
                }
                guard
                    let statusCode = (response as? HTTPURLResponse)?.statusCode
                    else { return }
                if String(statusCode).first == "2" {
                    return completion(true, formattedData)
                }
                completion(false, nil)
            } catch {
                completion(false, nil)
            }
        }
        task.resume()
    }
}
