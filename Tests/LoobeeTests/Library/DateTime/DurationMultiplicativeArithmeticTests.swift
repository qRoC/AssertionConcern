// This file is part of the Loobee package.
//
// (c) Andrey Savitsky <contact@qroc.pro>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import XCTest
#if canImport(Loobee)
@testable import Loobee
#else
@testable import LoobeeDateTime
#endif

internal final class DurationMultiplicativeArithmeticTests: XCTestCase {
    ///
    func testMultiplicationSameUnits() {
        XCTAssertEqual(Duration.microseconds(200) * Duration.microseconds(10), Duration.milliseconds(2))
    }

    ///
    func testMultiplicationDifferentUnits() {
        XCTAssertEqual(Duration.microseconds(2) * Duration.milliseconds(1), Duration.milliseconds(2))
    }

    ///
    func testMultiplicationWithUniformUnit() {
        XCTAssertEqual(Duration.microseconds(200) * 5, Duration.milliseconds(1))
    }

    ///
    func testMutableMultiplicationSameUnits() {
        var duration: Duration = .microseconds(10)
        duration *= .microseconds(200)

        XCTAssertEqual(duration, .milliseconds(2))
    }

    ///
    func testMutableMultiplicationDifferentUnits() {
        var duration: Duration = .microseconds(2)
        duration *= .milliseconds(1)

        XCTAssertEqual(duration, Duration.milliseconds(2))
    }

    ///
    func testMutableMultiplicationWithUniformUnit() {
        var duration: Duration = .microseconds(200)
        duration *= 5

        XCTAssertEqual(duration, Duration.milliseconds(1))
    }

    ///
    func testDivisionQuotientSameUnits() {
        XCTAssertEqual(Duration.microseconds(200) / Duration.microseconds(10), Duration.microseconds(20))
    }

    ///
    func testDivisionQuotientDifferentUnits() {
        XCTAssertEqual(Duration.milliseconds(2) / Duration.microseconds(500), Duration.microseconds(4))
    }

    ///
    func testDivisionQuotientWithUniformUnit() {
        XCTAssertEqual(Duration.microseconds(200) / 5, Duration.microseconds(40))
    }

    ///
    func testMutableDivisionQuotientSameUnits() {
        var duration: Duration = .microseconds(200)
        duration /= .microseconds(100)

        XCTAssertEqual(duration, .microseconds(2))
    }

    ///
    func testMutableDivisionQuotientDifferentUnits() {
        var duration: Duration = .milliseconds(2)
        duration /= .microseconds(500)

        XCTAssertEqual(duration, Duration.microseconds(4))
    }

    ///
    func testMutableDivisionQuotientWithUniformUnit() {
        var duration: Duration = .microseconds(200)
        duration /= 5

        XCTAssertEqual(duration, Duration.microseconds(40))
    }

    ///
    func testDivisionQuotientPrecisionLoss() {
        XCTAssertEqual(Duration.milliseconds(1) / Duration.microseconds(450), Duration.microseconds(2))
    }

    ///
    func testDivisionRemainderSameUnits() {
        XCTAssertEqual(Duration.microseconds(500) % Duration.microseconds(50), Duration.microseconds(0))
    }

    ///
    func testDivisionRemainderDifferentUnits() {
        XCTAssertEqual(Duration.milliseconds(1) % Duration.microseconds(450), Duration.microseconds(100))
    }

    ///
    func testDivisionRemainderWithUniformUnit() {
        XCTAssertEqual(Duration.microseconds(200) % 5, Duration.microseconds(0))
    }

    ///
    func testMutableRemainderQuotientSameUnits() {
        var duration: Duration = .microseconds(500)
        duration %= .microseconds(10)

        XCTAssertEqual(duration, .microseconds(0))
    }

    ///
    func testMutableRemainderQuotientDifferentUnits() {
        var duration: Duration = .milliseconds(2)
        duration %= .microseconds(550)

        XCTAssertEqual(duration, Duration.microseconds(350))
    }

    ///
    func testMutableRemainderQuotientWithUniformUnit() {
        var duration: Duration = .microseconds(480)
        duration %= 11

        XCTAssertEqual(duration, Duration.microseconds(7))
    }
}
