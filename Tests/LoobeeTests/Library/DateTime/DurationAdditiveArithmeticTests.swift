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

internal final class DurationAdditiveArithmeticTests: XCTestCase {
    ///
    func testZero() {
        XCTAssertEqual(Duration.zero, 0)
    }

    ///
    func testAddSameUnits() {
        XCTAssertEqual(Duration.months(4) + Duration.months(8), Duration.years(1))
    }

    ///
    func testAddDifferentUnits() {
        XCTAssertEqual(Duration.minutes(58) + Duration.seconds(120), Duration.hours(1))
    }

    ///
    func testAddWithUniformUnit() {
        XCTAssertEqual(Duration.minutes(58) + 2, Duration.hours(1))
    }

    ///
    func testMutableAddSameUnits() {
        var duration: Duration = .months(4)
        duration += .months(8)
        XCTAssertEqual(duration, .years(1))
    }

    ///
    func testMutableAddDifferentUnits() {
        var duration: Duration = .minutes(58)
        duration += .seconds(120)
        XCTAssertEqual(duration, .hours(1))
    }

    ///
    func testMutableAddWithUniformUnit() {
        var duration: Duration = .minutes(58)
        duration += 2
        XCTAssertEqual(duration, .hours(1))
    }

    ///
    func testSubtractSameUnits() {
        XCTAssertEqual(Duration.months(4) - Duration.months(8), Duration.months(-4))
    }

    ///
    func testSubtractDifferentUnits() {
        XCTAssertEqual(Duration.minutes(62) - Duration.seconds(120), Duration.hours(1))
    }

    ///
    func testSubtractWithUniformUnit() {
        XCTAssertEqual(Duration.minutes(58) - 2, Duration.minutes(56))
    }

    ///
    func testMutableSubtractSameUnits() {
        var duration: Duration = .months(4)
        duration -= .months(8)
        XCTAssertEqual(duration, .months(-4))
    }

    ///
    func testMutableSubtractDifferentUnits() {
        var duration: Duration = .minutes(62)
        duration -= .seconds(120)
        XCTAssertEqual(duration, .hours(1))
    }

    ///
    func testMutableSubtractWithUniformUnit() {
        var duration: Duration = .minutes(62)
        duration -= 2
        XCTAssertEqual(duration, Duration.hours(1))
    }
}
