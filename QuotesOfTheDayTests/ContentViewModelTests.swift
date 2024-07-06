@testable import QuotesOfTheDay
import XCTest

final class ContentViewModelTests: XCTestCase {
    
    func testRandomizeQuote_whenCalled_randomizeQuote() {
        let quoteGenerator = QuoteGeneratorSpy()
        let sut = ContentViewModel(quoteGenerator: quoteGenerator)
        
        sut.randomizeQuote()
        
        XCTAssertEqual(quoteGenerator.messages, [ .randomizeQuote ])
    }
}
