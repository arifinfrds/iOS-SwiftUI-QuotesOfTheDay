import Combine
import Domain
import UIKit

final class ContentViewModel: ObservableObject {
    
    @Published var quote: Quote = .default
    @Published var isShareSheetPresented = false
    
    var copiedText: String {
        pasteboard.string ?? ""
    }
    
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
    
    func shareCurrentQuote() {
        copyCurrentQuote()
        isShareSheetPresented = true
    }
}
