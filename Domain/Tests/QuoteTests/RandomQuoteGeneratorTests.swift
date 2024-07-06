import XCTest
@testable import Domain

final class RandomQuoteGeneratorTests: XCTestCase {
    
    func testQuote_whenCalled_returnsNonEmptyItems() {
        let sut = RandomQuoteGenerator()
        
        XCTAssertFalse(sut.quotes.isEmpty)
    }
}
