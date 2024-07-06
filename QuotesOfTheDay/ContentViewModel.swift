import Combine
import Domain

final class ContentViewModel: ObservableObject {
    
    @Published var quote: Quote = .default
    
    private let quoteGenerator: any QuoteGenerator
    
    init(quoteGenerator: some QuoteGenerator) {
        self.quoteGenerator = quoteGenerator
    }
    
    func randomizeQuote() {
        quote = quoteGenerator.randomizeQuote()
    }
}
