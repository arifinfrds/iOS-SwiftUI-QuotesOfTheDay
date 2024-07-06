import Domain

final class QuoteGeneratorSpy: QuoteGenerator {
    
    private(set) var messages = [Message]()
    
    enum Message: Equatable {
        case randomizeQuote
    }
    
    func randomizeQuote() -> Quote {
        messages.append(.randomizeQuote)
        return Quote.default
    }
}
