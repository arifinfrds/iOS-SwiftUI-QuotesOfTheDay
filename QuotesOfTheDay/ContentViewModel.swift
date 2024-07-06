import Combine
import Domain
import UIKit

final class ContentViewModel: ObservableObject {
    
    @Published var quote: Quote = .default
    
    private let quoteGenerator: any QuoteGenerator
    private let pasteboard: UIPasteboard
    
    init(
        quoteGenerator: some QuoteGenerator,
        pasteboard: UIPasteboard
    ) {
        self.quoteGenerator = quoteGenerator
        self.pasteboard = pasteboard
    }
    
    func randomizeQuote() {
        quote = quoteGenerator.randomizeQuote()
    }
    
    func copyCurrentQuote() {
        pasteboard.string = "\(quote.message) - \(quote.owner)"
    }
}
