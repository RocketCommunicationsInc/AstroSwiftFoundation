#if !os(watchOS)
import XCTest
@testable import AstroSwiftFoundation

final class AstroSwiftFoundationTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(AstroSwiftFoundation().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
#endif
