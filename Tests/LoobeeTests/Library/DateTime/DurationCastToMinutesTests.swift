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

internal final class DurationCastToMinutesTests: XCTestCase {
    ///
    func testFromPositiveNanoseconds() {
        let duration = Duration.nanoseconds(120000000000).minutes
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeNanoseconds() {
        let duration = Duration.nanoseconds(-120000000000).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueNanoseconds() {
        let duration = Duration.nanoseconds(0).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromNanosecondsPrecisionLoss() {
        let duration = Duration.nanoseconds(119999999999).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveMicroseconds() {
        let duration = Duration.microseconds(120000000).minutes
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeMicroseconds() {
        let duration = Duration.microseconds(-120000000).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueMicroseconds() {
        let duration = Duration.microseconds(0).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMicrosecondsPrecisionLoss() {
        let duration = Duration.microseconds(119999999).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveMilliseconds() {
        let duration = Duration.milliseconds(120000).minutes
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeMilliseconds() {
        let duration = Duration.milliseconds(-120000).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueMilliseconds() {
        let duration = Duration.milliseconds(0).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMillisecondsPrecisionLoss() {
        let duration = Duration.milliseconds(119999).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveSeconds() {
        let duration = Duration.seconds(120).minutes
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeSeconds() {
        let duration = Duration.seconds(-120).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueSeconds() {
        let duration = Duration.seconds(0).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromSecondsPrecisionLoss() {
        let duration = Duration.seconds(119).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveMinutes() {
        let duration = Duration.minutes(2).minutes
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeMinutes() {
        let duration = Duration.minutes(-2).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueMinutes() {
        let duration = Duration.minutes(0).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromPositiveHours() {
        let duration = Duration.hours(2).minutes
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 120)
    }

    ///
    func testFromNegativeHours() {
        let duration = Duration.hours(-2).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, -120)
    }

    ///
    func testFromZeroValueHours() {
        let duration = Duration.hours(0).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromHoursOverflow() {
        XCTAssertNil(Duration.hours(Int64.max).minutes)
    }

    ///
    func testFromPositiveDays() {
        let duration = Duration.days(2).minutes
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 2880)
    }

    ///
    func testFromNegativeDays() {
        let duration = Duration.days(-2).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, -2880)
    }

    ///
    func testFromZeroValueDays() {
        let duration = Duration.days(0).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromDaysOverflow() {
        XCTAssertNil(Duration.days(Int64.max).minutes)
    }

    ///
    func testFromPositiveWeeks() {
        let duration = Duration.weeks(2).minutes
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 20160)
    }

    ///
    func testFromNegativeWeeks() {
        let duration = Duration.weeks(-2).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, -20160)
    }

    ///
    func testFromZeroValueWeeks() {
        let duration = Duration.weeks(0).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromWeeksOverflow() {
        XCTAssertNil(Duration.weeks(Int64.max).minutes)
    }

    ///
    func testFromPositiveMonths() {
        let duration = Duration.months(2).minutes
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 87658)
    }

    ///
    func testFromNegativeMonths() {
        let duration = Duration.months(-2).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, -87658)
    }

    ///
    func testFromZeroValueMonths() {
        let duration = Duration.months(0).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMonthsOverflow() {
        XCTAssertNil(Duration.months(Int64.max).minutes)
    }

    ///
    func testFromPositiveYears() {
        let duration = Duration.years(2).minutes
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 1051898)
    }

    ///
    func testFromNegativeYears() {
        let duration = Duration.years(-2).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, -1051898)
    }

    ///
    func testFromZeroValueYears() {
        let duration = Duration.years(0).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromYearsOverflow() {
        XCTAssertNil(Duration.years(Int64.max).minutes)
    }

    ///
    func testFromPositiveUniform() {
        let duration = Duration(2).minutes
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeUniform() {
        let duration = Duration(-2).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueUniform() {
        let duration = Duration(0).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .minutes)
        XCTAssertEqual(duration?.count, 0)
    }
}
