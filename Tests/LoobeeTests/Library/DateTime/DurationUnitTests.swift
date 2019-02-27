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

internal final class DurationUnitTests: XCTestCase {
    ///
    func testEquatableMonthsWithMonths() {
        XCTAssertTrue(DurationUnit.months == DurationUnit.months)
    }

    ///
    func testEquatableMonthsWithYears() {
        XCTAssertFalse(DurationUnit.months == DurationUnit.years)
    }

    ///
    func testEquatableWeeksWithUniform() {
        XCTAssertTrue(DurationUnit.weeks == DurationUnit.uniform)
    }

    ///
    func testEquatableUniformWithUniform() {
        XCTAssertTrue(DurationUnit.uniform == DurationUnit.uniform)
    }

    ///
    func testComparableLessSecondsWithMinutes() {
        XCTAssertTrue(DurationUnit.seconds < DurationUnit.minutes)
    }

    ///
    func testComparableLessHoursWithMinutes() {
        XCTAssertFalse(DurationUnit.hours < DurationUnit.minutes)
    }

    ///
    func testComparableLessUniformWithMinutes() {
        XCTAssertFalse(DurationUnit.uniform < DurationUnit.minutes)
    }

    ///
    func testComparableLessHoursWithUniform() {
        XCTAssertFalse(DurationUnit.hours < DurationUnit.uniform)
    }

    ///
    func testComparableLessUniformWithUniform() {
        XCTAssertFalse(DurationUnit.uniform < DurationUnit.uniform)
    }

    ///
    func testComparableLessOrEqualSecondsWithMinutes() {
        XCTAssertTrue(DurationUnit.seconds <= DurationUnit.minutes)
    }

    ///
    func testComparableLessOrEqualMinutesWithMinutes() {
        XCTAssertTrue(DurationUnit.minutes <= DurationUnit.minutes)
    }

    ///
    func testComparableLessOrEqualHoursWithMinutes() {
        XCTAssertFalse(DurationUnit.hours <= DurationUnit.minutes)
    }

    ///
    func testComparableLessOrEqualUniformWithMinutes() {
        XCTAssertTrue(DurationUnit.uniform <= DurationUnit.minutes)
    }

    ///
    func testComparableLessOrEqualHoursWithUniform() {
        XCTAssertTrue(DurationUnit.hours <= DurationUnit.uniform)
    }

    ///
    func testComparableLessOrEqualUniformWithUniform() {
        XCTAssertTrue(DurationUnit.uniform <= DurationUnit.uniform)
    }

    ///
    func testComparableGreaterHoursWithMinutes() {
        XCTAssertTrue(DurationUnit.hours > DurationUnit.minutes)
    }

    ///
    func testComparableGreaterSecondsWithMinutes() {
        XCTAssertFalse(DurationUnit.seconds > DurationUnit.minutes)
    }

    ///
    func testComparableGreaterUniformWithMinutes() {
        XCTAssertFalse(DurationUnit.uniform > DurationUnit.minutes)
    }

    ///
    func testComparableGreaterHoursWithUniform() {
        XCTAssertFalse(DurationUnit.hours > DurationUnit.uniform)
    }

    ///
    func testComparableGreaterUniformWithUniform() {
        XCTAssertFalse(DurationUnit.uniform > DurationUnit.uniform)
    }

    ///
    func testComparableGreaterOrEqualHoursWithMinutes() {
        XCTAssertTrue(DurationUnit.hours >= DurationUnit.minutes)
    }

    ///
    func testComparableGreaterOrEqualMinutesWithMinutes() {
        XCTAssertTrue(DurationUnit.minutes >= DurationUnit.minutes)
    }

    ///
    func testComparableGreaterOrEqualSecondsWithMinutes() {
        XCTAssertFalse(DurationUnit.seconds >= DurationUnit.minutes)
    }

    ///
    func testComparableGreaterOrEqualUniformWithMinutes() {
        XCTAssertTrue(DurationUnit.uniform >= DurationUnit.minutes)
    }

    ///
    func testComparableGreaterOrEqualHoursWithUniform() {
        XCTAssertTrue(DurationUnit.hours >= DurationUnit.uniform)
    }

    ///
    func testComparableGreaterOrEqualUniformWithUniform() {
        XCTAssertTrue(DurationUnit.uniform >= DurationUnit.uniform)
    }
}
