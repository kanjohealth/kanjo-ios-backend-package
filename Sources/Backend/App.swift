public struct BackendApp {
    public init() {
        print("run")
    }
    
    @available(iOS 15.0, *)
    @available(macOS 12.0, *)
    public func run() async {
        let engine = Engine(model: Model(email: "se-a@mail.ru", pin: "1234"))
//        engine.makeRequest()
        try? await engine.send()
//        print("compleet")
    }
}
