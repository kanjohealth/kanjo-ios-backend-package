#if os(macOS)
@main
struct App {
    static func main() async {
        print("run")
    }
}
#elseif os(iOS)
#endif
