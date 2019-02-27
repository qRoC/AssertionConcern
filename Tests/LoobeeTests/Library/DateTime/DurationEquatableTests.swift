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

internal final class DurationEquatableTests: XCTestCase {
    ///
    func testSameCountAndTimeUnit() {
        XCTAssertEqual(Duration.seconds(10), Duration.seconds(10))
    }

    ///
    func testSameCountOnly() {
        XCTAssertNotEqual(Duration.seconds(10), Duration.nanoseconds(10))
    }

    ///
    func testSameTimeUnitOnly() {
        XCTAssertNotEqual(Duration.seconds(10), Duration.seconds(100))
    }

    ///
    func testCastEqual() {
        XCTAssertEqual(Duration.seconds(60), Duration.minutes(1))
    }

    ///
    func testCastEqualWithPrecisionLoss() {
        XCTAssertNotEqual(Duration.seconds(61), Duration.minutes(1))
    }

    ///
    func testRhsUniformSameCount() {
        XCTAssertEqual(Duration.seconds(10), 10)
    }

    ///
    func testLhsUniformSameCount() {
        XCTAssertEqual(15, Duration.hours(15))
    }

    ///
    func testLhsCastOverflow() {
        XCTAssertNotEqual(Duration.months(Int64.max), Duration.milliseconds(Int64.max))
    }

    ///
    func testRhsCastOverflow() {
        XCTAssertNotEqual(Duration.nanoseconds(Int64.max), Duration.years(Int64.max))
    }
}
