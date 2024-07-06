@testable import QuotesOfTheDay
import Domain
import XCTest

final class ContentViewModelTests: XCTestCase {
    
    func testRandomizeQuote_whenCalled_randomizeQuote() {
        let quoteGenerator = QuoteGeneratorSpy()
        let sut = ContentViewModel(quoteGenerator: quoteGenerator)
        
        sut.randomizeQuote()
        
        XCTAssertEqual(quoteGenerator.messages, [ .randomizeQuote ])
    }
}

private final class QuoteGeneratorSpy: QuoteGenerator {
    
    private(set) var messages = [Message]()
    
    enum Message: Equatable {
        case randomizeQuote
    }
    
    func randomizeQuote() -> Quote {
        messages.append(.randomizeQuote)
        return Quote.default
    }
}
