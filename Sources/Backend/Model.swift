import Foundation

public struct Model: Codable {
    let email: String
    let pin: String
    public init(email: String, pin: String) {
        self.email = email
        self.pin = pin
    }
}
