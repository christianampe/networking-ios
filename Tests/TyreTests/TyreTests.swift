import XCTest
@testable import Tyre

final class TyreTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Tyre().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
