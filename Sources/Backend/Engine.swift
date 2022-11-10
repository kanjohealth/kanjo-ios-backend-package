import Foundation

public struct Engine {
    
    let model: Model
    
    var url: URL {
        URL(string: "https://notification.mykanjo.com/email/pin")!
    }
    
    var body: Data {
        let encoder = JSONEncoder()
        return try! encoder.encode(model)
    }
    
    var request: URLRequest {
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData)
        request.httpMethod = "POST"
        request.httpBody = body
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        return request
    }
    
    public init(model: Model) {
        self.model = model
    }
    
    public func send() async throws -> (Data, URLResponse) {
        try await URLSession.shared.data(for: request)
    }
    
}
