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

internal final class DurationCastToYearsTests: XCTestCase {
    ///
    func testFromPositiveNanoseconds() {
        let duration = Duration.nanoseconds(63113904000000000).years
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeNanoseconds() {
        let duration = Duration.nanoseconds(-63113904000000000).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueNanoseconds() {
        let duration = Duration.nanoseconds(0).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromNanosecondsPrecisionLoss() {
        let duration = Duration.nanoseconds(63113903999999999).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveMicroseconds() {
        let duration = Duration.microseconds(63113904000000).years
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeMicroseconds() {
        let duration = Duration.microseconds(-63113904000000).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueMicroseconds() {
        let duration = Duration.microseconds(0).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMicrosecondsPrecisionLoss() {
        let duration = Duration.microseconds(63113903999999).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveMilliseconds() {
        let duration = Duration.milliseconds(63113904000).years
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeMilliseconds() {
        let duration = Duration.milliseconds(-63113904000).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueMilliseconds() {
        let duration = Duration.milliseconds(0).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMillisecondsPrecisionLoss() {
        let duration = Duration.milliseconds(63113903999).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveSeconds() {
        let duration = Duration.seconds(63113904).years
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeSeconds() {
        let duration = Duration.seconds(-63113904).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueSeconds() {
        let duration = Duration.seconds(0).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromSecondsPrecisionLoss() {
        let duration = Duration.seconds(63113903).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromMinutesLast() {
        let duration = Duration.minutes(1051898).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromMinutesFirst() {
        let duration = Duration.minutes(1051899).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromZeroValueMinutes() {
        let duration = Duration.minutes(0).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMinutesPrecisionLoss() {
        let duration = Duration.minutes(1051897).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromHoursLast() {
        let duration = Duration.hours(17531).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromHoursFirst() {
        let duration = Duration.hours(17532).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromZeroValueHours() {
        let duration = Duration.hours(0).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromHoursPrecisionLoss() {
        let duration = Duration.hours(17529).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromDaysLast() {
        let duration = Duration.days(730).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromDaysFirst() {
        let duration = Duration.days(731).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromZeroValueDays() {
        let duration = Duration.days(0).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromDaysPrecisionLoss() {
        let duration = Duration.days(729).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromWeeksLast() {
        let duration = Duration.weeks(104).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromWeeksFirst() {
        let duration = Duration.weeks(105).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromZeroValueWeeks() {
        let duration = Duration.weeks(0).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromWeeksPrecisionLoss() {
        let duration = Duration.weeks(103).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveMonths() {
        let duration = Duration.months(24).years
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeMonths() {
        let duration = Duration.months(-24).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueMonths() {
        let duration = Duration.months(0).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMonthsPrecisionLoss() {
        let duration = Duration.months(23).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveYears() {
        let duration = Duration.years(2).years
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeYears() {
        let duration = Duration.years(-2).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueYears() {
        let duration = Duration.years(0).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromPositiveUniform() {
        let duration = Duration(2).years
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeUniform() {
        let duration = Duration(-2).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueUniform() {
        let duration = Duration(0).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .years)
        XCTAssertEqual(duration?.count, 0)
    }
}
