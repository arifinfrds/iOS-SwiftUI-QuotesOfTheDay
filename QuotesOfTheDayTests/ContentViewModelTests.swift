@testable import QuotesOfTheDay
import XCTest

final class ContentViewModelTests: XCTestCase {
    
    func testRandomizeQuote_whenCalled_randomizeQuote() {
        let quoteGenerator = QuoteGeneratorSpy()
        let sut = ContentViewModel(quoteGenerator: quoteGenerator, pasteboard: .general)
        
        sut.randomizeQuote()
        
        XCTAssertEqual(quoteGenerator.messages, [ .randomizeQuote ])
    }
    
    func testCopyCurrentQuote_whenCalled_copyCurrentQuoteToPasteBoard() {
        let quoteGenerator = QuoteGeneratorSpy()
        let pasteboard = UIPasteboard.general
        let sut = ContentViewModel(quoteGenerator: quoteGenerator, pasteboard: pasteboard)
        sut.randomizeQuote()
        
        sut.copyCurrentQuote()
        
        XCTAssertEqual(pasteboard.string, "\(sut.quote.message) - \(sut.quote.owner)")
    }
    
    func testShareCurrentQuote_whenCalled_shareQuote() {
        let quoteGenerator = QuoteGeneratorSpy()
        let pasteboard = UIPasteboard.general
        let sut = ContentViewModel(quoteGenerator: quoteGenerator, pasteboard: pasteboard)
        sut.randomizeQuote()
        
        sut.shareCurrentQuote()
        
        XCTAssertEqual(pasteboard.string, "\(sut.quote.message) - \(sut.quote.owner)")
        XCTAssertTrue(sut.isShareSheetPresented)
    }
}
