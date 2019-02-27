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

internal final class DurationCastToDaysTests: XCTestCase {
    ///
    func testFromPositiveNanoseconds() {
        let duration = Duration.nanoseconds(172800000000000).days
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeNanoseconds() {
        let duration = Duration.nanoseconds(-172800000000000).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueNanoseconds() {
        let duration = Duration.nanoseconds(0).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromNanosecondsPrecisionLoss() {
        let duration = Duration.nanoseconds(172799999999999).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveMicroseconds() {
        let duration = Duration.microseconds(172800000000).days
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeMicroseconds() {
        let duration = Duration.microseconds(-172800000000).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueMicroseconds() {
        let duration = Duration.microseconds(0).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMicrosecondsPrecisionLoss() {
        let duration = Duration.microseconds(172799999999).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveMilliseconds() {
        let duration = Duration.milliseconds(172800000).days
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeMilliseconds() {
        let duration = Duration.milliseconds(-172800000).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueMilliseconds() {
        let duration = Duration.milliseconds(0).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMillisecondsPrecisionLoss() {
        let duration = Duration.milliseconds(172799999).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveSeconds() {
        let duration = Duration.seconds(172800).days
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeSeconds() {
        let duration = Duration.seconds(-172800).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueSeconds() {
        let duration = Duration.seconds(0).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromSecondsPrecisionLoss() {
        let duration = Duration.seconds(172799).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveMinutes() {
        let duration = Duration.minutes(2880).days
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeMinutes() {
        let duration = Duration.minutes(-2880).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueMinutes() {
        let duration = Duration.minutes(0).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMinutesPrecisionLoss() {
        let duration = Duration.minutes(2879).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveHours() {
        let duration = Duration.hours(48).days
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeHours() {
        let duration = Duration.hours(-48).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueHours() {
        let duration = Duration.hours(0).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromHoursPrecisionLoss() {
        let duration = Duration.hours(47).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveDays() {
        let duration = Duration.days(2).days
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeDays() {
        let duration = Duration.days(-2).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueDays() {
        let duration = Duration.days(0).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromPositiveWeeks() {
        let duration = Duration.weeks(2).days
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 14)
    }

    ///
    func testFromNegativeWeeks() {
        let duration = Duration.weeks(-2).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, -14)
    }

    ///
    func testFromZeroValueWeeks() {
        let duration = Duration.weeks(0).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromWeeksOverflow() {
        XCTAssertNil(Duration.weeks(Int64.max).days)
    }

    ///
    func testFromPositiveMonths() {
        let duration = Duration.months(2).days
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 60)
    }

    ///
    func testFromNegativeMonths() {
        let duration = Duration.months(-2).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, -60)
    }

    ///
    func testFromZeroValueMonths() {
        let duration = Duration.months(0).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMonthsOverflow() {
        XCTAssertNil(Duration.months(Int64.max).days)
    }

    ///
    func testFromPositiveYears() {
        let duration = Duration.years(2).days
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 730)
    }

    ///
    func testFromNegativeYears() {
        let duration = Duration.years(-2).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, -730)
    }

    ///
    func testFromZeroValueYears() {
        let duration = Duration.years(0).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromYearsOverflow() {
        XCTAssertNil(Duration.years(Int64.max).days)
    }

    ///
    func testFromPositiveUniform() {
        let duration = Duration(2).days
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeUniform() {
        let duration = Duration(-2).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueUniform() {
        let duration = Duration(0).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .days)
        XCTAssertEqual(duration?.count, 0)
    }
}
