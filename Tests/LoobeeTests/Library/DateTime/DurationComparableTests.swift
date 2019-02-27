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

internal final class DurationComparableTests: XCTestCase {
    ///
    func testLessSameUnitsLessCase() {
        XCTAssertTrue(Duration.microseconds(9) < Duration.microseconds(10))
    }

    ///
    func testLessSameUnitsEqualCase() {
        XCTAssertFalse(Duration.seconds(10) < Duration.seconds(10))
    }

    ///
    func testLessSameUnitsGreaterCase() {
        XCTAssertFalse(Duration.seconds(11) < Duration.seconds(10))
    }

    ///
    func testLessDifferentUnitsLessCase() {
        XCTAssertTrue(Duration.minutes(200) < Duration.weeks(1))
    }

    ///
    func testLessDifferentUnitsEqualCase() {
        XCTAssertFalse(Duration.minutes(60) < Duration.hours(1))
    }

    ///
    func testLessDifferentUnitsGreaterCase() {
        XCTAssertFalse(Duration.months(60) < Duration.years(1))
    }

    ///
    func testLessLhsUniformUnitsLessCase() {
        XCTAssertTrue(61 < Duration.months(62))
    }

    ///
    func testLessLhsUniformUnitsEqualCase() {
        XCTAssertFalse(60 < Duration.months(60))
    }

    ///
    func testLessLhsUniformUnitsGreaterCase() {
        XCTAssertFalse(61 < Duration.months(60))
    }

    ///
    func testLessRhsUniformUnitsLessCase() {
        XCTAssertTrue(Duration.months(60) < 61)
    }

    ///
    func testLessRhsUniformUnitsEqualCase() {
        XCTAssertFalse(Duration.months(60) < 60)
    }

    ///
    func testLessRhsUniformUnitsGreaterCase() {
        XCTAssertFalse(Duration.months(60) < 59)
    }

    ///
    func testLessLhsCastOverflow() {
        XCTAssertTrue(Duration.hours(Int64.max) < Duration.days(Int64.max))
    }

    ///
    func testLessRhsCastOverflow() {
        XCTAssertFalse(Duration.weeks(Int64.max) < Duration.days(Int64.max))
    }

    ///
    func testLessOrEqualSameUnitsLessCase() {
        XCTAssertTrue(Duration.microseconds(9) <= Duration.microseconds(10))
    }

    ///
    func testLessOrEqualSameUnitsEqualCase() {
        XCTAssertTrue(Duration.seconds(10) <= Duration.seconds(10))
    }

    ///
    func testLessOrEqualSameUnitsGreaterCase() {
        XCTAssertFalse(Duration.seconds(11) <= Duration.seconds(10))
    }

    ///
    func testLessOrEqualDifferentUnitsLessCase() {
        XCTAssertTrue(Duration.minutes(200) <= Duration.weeks(1))
    }

    ///
    func testLessOrEqualDifferentUnitsEqualCase() {
        XCTAssertTrue(Duration.minutes(60) <= Duration.hours(1))
    }

    ///
    func testLessOrEqualDifferentUnitsGreaterCase() {
        XCTAssertFalse(Duration.months(60) <= Duration.years(1))
    }

    ///
    func testLessOrEqualLhsUniformUnitsLessCase() {
        XCTAssertTrue(61 <= Duration.months(62))
    }

    ///
    func testLessOrEqualLhsUniformUnitsEqualCase() {
        XCTAssertTrue(60 <= Duration.months(60))
    }

    ///
    func testLessOrEqualLhsUniformUnitsGreaterCase() {
        XCTAssertFalse(61 <= Duration.months(60))
    }

    ///
    func testLessOrEqualRhsUniformUnitsLessCase() {
        XCTAssertTrue(Duration.months(60) <= 61)
    }

    ///
    func testLessOrEqualRhsUniformUnitsEqualCase() {
        XCTAssertTrue(Duration.months(60) <= 60)
    }

    ///
    func testLessOrEqualRhsUniformUnitsGreaterCase() {
        XCTAssertFalse(Duration.months(60) <= 59)
    }

    ///
    func testLessOrEqualLhsCastOverflow() {
        XCTAssertTrue(Duration.hours(Int64.max) <= Duration.days(Int64.max))
    }

    ///
    func testLessOrEqualRhsCastOverflow() {
        XCTAssertFalse(Duration.weeks(Int64.max) <= Duration.days(Int64.max))
    }

    ///
    func testGreaterSameUnitsLessCase() {
        XCTAssertFalse(Duration.microseconds(9) > Duration.microseconds(10))
    }

    ///
    func testGreaterSameUnitsEqualCase() {
        XCTAssertFalse(Duration.seconds(10) > Duration.seconds(10))
    }

    ///
    func testGreaterSameUnitsGreaterCase() {
        XCTAssertTrue(Duration.seconds(11) > Duration.seconds(10))
    }

    ///
    func testGreaterDifferentUnitsLessCase() {
        XCTAssertFalse(Duration.minutes(200) > Duration.weeks(1))
    }

    ///
    func testGreaterDifferentUnitsEqualCase() {
        XCTAssertFalse(Duration.minutes(60) > Duration.hours(1))
    }

    ///
    func testGreaterDifferentUnitsGreaterCase() {
        XCTAssertTrue(Duration.months(60) > Duration.years(1))
    }

    ///
    func testGreaterLhsUniformUnitsLessCase() {
        XCTAssertFalse(61 > Duration.months(62))
    }

    ///
    func testGreaterLhsUniformUnitsEqualCase() {
        XCTAssertFalse(60 > Duration.months(60))
    }

    ///
    func testGreaterLhsUniformUnitsGreaterCase() {
        XCTAssertTrue(61 > Duration.months(60))
    }

    ///
    func testGreaterRhsUniformUnitsLessCase() {
        XCTAssertFalse(Duration.months(60) > 61)
    }

    ///
    func testGreaterRhsUniformUnitsEqualCase() {
        XCTAssertFalse(Duration.months(60) > 60)
    }

    ///
    func testGreaterRhsUniformUnitsGreaterCase() {
        XCTAssertTrue(Duration.months(60) > 59)
    }

    ///
    func testGreaterLhsCastOverflow() {
        XCTAssertFalse(Duration.hours(Int64.max) > Duration.days(Int64.max))
    }

    ///
    func testGreaterRhsCastOverflow() {
        XCTAssertTrue(Duration.weeks(Int64.max) > Duration.days(Int64.max))
    }

    ///
    func testGreaterOrEqualSameUnitsLessCase() {
        XCTAssertFalse(Duration.microseconds(9) >= Duration.microseconds(10))
    }

    ///
    func testGreaterOrEqualSameUnitsEqualCase() {
        XCTAssertTrue(Duration.seconds(10) >= Duration.seconds(10))
    }

    ///
    func testGreaterOrEqualSameUnitsGreaterCase() {
        XCTAssertTrue(Duration.seconds(11) >= Duration.seconds(10))
    }

    ///
    func testGreaterOrEqualDifferentUnitsLessCase() {
        XCTAssertFalse(Duration.minutes(200) >= Duration.weeks(1))
    }

    ///
    func testGreaterOrEqualDifferentUnitsEqualCase() {
        XCTAssertTrue(Duration.minutes(60) >= Duration.hours(1))
    }

    ///
    func testGreaterOrEqualDifferentUnitsGreaterCase() {
        XCTAssertTrue(Duration.months(60) >= Duration.years(1))
    }

    ///
    func testGreaterOrEqualLhsUniformUnitsLessCase() {
        XCTAssertFalse(61 >= Duration.months(62))
    }

    ///
    func testGreaterOrEqualLhsUniformUnitsEqualCase() {
        XCTAssertTrue(60 >= Duration.months(60))
    }

    ///
    func testGreaterOrEqualLhsUniformUnitsGreaterCase() {
        XCTAssertTrue(61 >= Duration.months(60))
    }

    ///
    func testGreaterOrEqualRhsUniformUnitsLessCase() {
        XCTAssertFalse(Duration.months(60) >= 61)
    }

    ///
    func testGreaterOrEqualRhsUniformUnitsEqualCase() {
        XCTAssertTrue(Duration.years(60) >= 60)
    }

    ///
    func testGreaterOrEqualRhsUniformUnitsGreaterCase() {
        XCTAssertTrue(Duration.months(60) >= 59)
    }

    ///
    func testGreaterOrEqualLhsCastOverflow() {
        XCTAssertFalse(Duration.hours(Int64.max) >= Duration.days(Int64.max))
    }

    ///
    func testGreaterOrEqualRhsCastOverflow() {
        XCTAssertTrue(Duration.years(Int64.max) >= Duration.weeks(Int64.max))
    }
}
