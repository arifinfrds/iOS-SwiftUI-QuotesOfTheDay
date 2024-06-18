public struct Quote {
    public let owner: String
    public let message: String
    
    public init(owner: String, message: String) {
        self.owner = owner
        self.message = message
    }
    
    public static let `default` = Quote(owner: "Albert Einstein", message: "Life is like riding a bicycle. To keep your balance, you must keep moving.")
}
