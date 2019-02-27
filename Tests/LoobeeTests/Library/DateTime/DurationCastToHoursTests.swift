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

internal final class DurationCastToHoursTests: XCTestCase {
    ///
    func testFromPositiveNanoseconds() {
        let duration = Duration.nanoseconds(7200000000000).hours
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeNanoseconds() {
        let duration = Duration.nanoseconds(-7200000000000).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueNanoseconds() {
        let duration = Duration.nanoseconds(0).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromNanosecondsPrecisionLoss() {
        let duration = Duration.nanoseconds(7199999999999).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveMicroseconds() {
        let duration = Duration.microseconds(7200000000).hours
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeMicroseconds() {
        let duration = Duration.microseconds(-7200000000).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueMicroseconds() {
        let duration = Duration.microseconds(0).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMicrosecondsPrecisionLoss() {
        let duration = Duration.microseconds(7199999999).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveMilliseconds() {
        let duration = Duration.milliseconds(7200000).hours
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeMilliseconds() {
        let duration = Duration.milliseconds(-7200000).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueMilliseconds() {
        let duration = Duration.milliseconds(0).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMillisecondsPrecisionLoss() {
        let duration = Duration.milliseconds(7199999).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveSeconds() {
        let duration = Duration.seconds(7200).hours
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeSeconds() {
        let duration = Duration.seconds(-7200).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueSeconds() {
        let duration = Duration.seconds(0).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromSecondsPrecisionLoss() {
        let duration = Duration.seconds(7199).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveMinutes() {
        let duration = Duration.minutes(120).hours
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeMinutes() {
        let duration = Duration.minutes(-120).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueMinutes() {
        let duration = Duration.minutes(0).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMinutesPrecisionLoss() {
        let duration = Duration.minutes(119).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveHours() {
        let duration = Duration.hours(2).hours
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeHours() {
        let duration = Duration.hours(-2).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueHours() {
        let duration = Duration.hours(0).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromPositiveDays() {
        let duration = Duration.days(2).hours
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 48)
    }

    ///
    func testFromNegativeDays() {
        let duration = Duration.days(-2).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, -48)
    }

    ///
    func testFromZeroValueDays() {
        let duration = Duration.days(0).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromDaysOverflow() {
        XCTAssertNil(Duration.days(Int64.max).hours)
    }

    ///
    func testFromPositiveWeeks() {
        let duration = Duration.weeks(2).hours
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 336)
    }

    ///
    func testFromNegativeWeeks() {
        let duration = Duration.weeks(-2).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, -336)
    }

    ///
    func testFromZeroValueWeeks() {
        let duration = Duration.weeks(0).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromWeeksOverflow() {
        XCTAssertNil(Duration.weeks(Int64.max).hours)
    }

    ///
    func testFromPositiveMonths() {
        let duration = Duration.months(2).hours
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 1460)
    }

    ///
    func testFromNegativeMonths() {
        let duration = Duration.months(-2).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, -1460)
    }

    ///
    func testFromZeroValueMonths() {
        let duration = Duration.months(0).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMonthsOverflow() {
        XCTAssertNil(Duration.months(Int64.max).hours)
    }

    ///
    func testFromPositiveYears() {
        let duration = Duration.years(2).hours
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 17531)
    }

    ///
    func testFromNegativeYears() {
        let duration = Duration.years(-2).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, -17531)
    }

    ///
    func testFromZeroValueYears() {
        let duration = Duration.years(0).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromYearsOverflow() {
        XCTAssertNil(Duration.years(Int64.max).hours)
    }

    ///
    func testFromPositiveUniform() {
        let duration = Duration(2).hours
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeUniform() {
        let duration = Duration(-2).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueUniform() {
        let duration = Duration(0).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .hours)
        XCTAssertEqual(duration?.count, 0)
    }
}
