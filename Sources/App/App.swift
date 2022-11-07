import Backend

#if os(macOS)
@main
struct App {
    static func main() async {
        let app = BackendApp()
        await app.run()
    }
}
#elseif os(iOS)
#endif
