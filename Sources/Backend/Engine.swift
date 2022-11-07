import Foundation

public struct Engine {
    
    let model: Model
    
    var url: URL {
        URL(string: "http://134.122.0.175:8080/email/pin")!
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

//@available(iOS 13.0, *)
//extension URLSession {
//    func data2(from url: URL) async throws -> (Data, URLResponse) {
//        try await withCheckedThrowingContinuation { continuation in
//            let task = self.dataTask(with: url) { data, response, error in
//                guard let data = data, let response = response else {
//                    let error = error ?? URLError(.badServerResponse)
//                    return continuation.resume(throwing: error)
//                }
//
//                continuation.resume(returning: (data, response))
//            }
//
//            task.resume()
//        }
//    }
//}
