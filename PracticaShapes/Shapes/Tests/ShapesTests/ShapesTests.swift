import XCTest
@testable import Shapes

final class ShapesTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(GeometricAreaCalculator().text, "Hello, World!")
    }
    func testAreaCalculator() {
        XCTAssertEqual(GeometricAreaCalculator().areaCalculator(shape: .square(side: 2)), 4)
    }
    func testAreaCalculatorCircle() {
        XCTAssertEqual(GeometricAreaCalculator().areaCalculator(shape:.circle(radius: 2)), 12.566370614359172)
    }
}
