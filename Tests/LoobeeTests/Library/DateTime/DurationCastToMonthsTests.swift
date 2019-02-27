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

internal final class DurationCastToMonthsTests: XCTestCase {
    ///
    func testFromPositiveNanoseconds() {
        let duration = Duration.nanoseconds(5259492000000000).months
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeNanoseconds() {
        let duration = Duration.nanoseconds(-5259492000000000).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueNanoseconds() {
        let duration = Duration.nanoseconds(0).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromNanosecondsPrecisionLoss() {
        let duration = Duration.nanoseconds(5259491999999999).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveMicroseconds() {
        let duration = Duration.microseconds(5259492000000).months
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeMicroseconds() {
        let duration = Duration.microseconds(-5259492000000).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueMicroseconds() {
        let duration = Duration.microseconds(0).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMicrosecondsPrecisionLoss() {
        let duration = Duration.microseconds(5259491999999).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveMilliseconds() {
        let duration = Duration.milliseconds(5259492000).months
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeMilliseconds() {
        let duration = Duration.milliseconds(-5259492000).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueMilliseconds() {
        let duration = Duration.milliseconds(0).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMillisecondsPrecisionLoss() {
        let duration = Duration.milliseconds(5259491999).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveSeconds() {
        let duration = Duration.seconds(5259492).months
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeSeconds() {
        let duration = Duration.seconds(-5259492).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueSeconds() {
        let duration = Duration.seconds(0).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromSecondsPrecisionLoss() {
        let duration = Duration.seconds(5259491).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromMinutesLast() {
        let duration = Duration.minutes(87658).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromMinutesFirst() {
        let duration = Duration.minutes(87659).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromZeroValueMinutes() {
        let duration = Duration.minutes(0).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMinutesPrecisionLoss() {
        let duration = Duration.minutes(87657).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromHoursLast() {
        let duration = Duration.hours(1460).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromHoursFirst() {
        let duration = Duration.hours(1461).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromZeroValueHours() {
        let duration = Duration.hours(0).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromHoursPrecisionLoss() {
        let duration = Duration.hours(1459).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromDaysLast() {
        let duration = Duration.days(60).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromDaysFirst() {
        let duration = Duration.days(61).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromZeroValueDays() {
        let duration = Duration.days(0).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromDaysPrecisionLoss() {
        let duration = Duration.days(59).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromWeeksLast() {
        let duration = Duration.weeks(8).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromWeeksFirst() {
        let duration = Duration.weeks(9).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromZeroValueWeeks() {
        let duration = Duration.weeks(0).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromWeeksPrecisionLoss() {
        let duration = Duration.weeks(7).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveMonths() {
        let duration = Duration.months(2).months
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeMonths() {
        let duration = Duration.months(-2).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueMonths() {
        let duration = Duration.months(0).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromPositiveYears() {
        let duration = Duration.years(2).months
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 24)
    }

    ///
    func testFromNegativeYears() {
        let duration = Duration.years(-2).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, -24)
    }

    ///
    func testFromZeroValueYears() {
        let duration = Duration.years(0).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromYearsOverflow() {
        XCTAssertNil(Duration.years(Int64.max).months)
    }

    ///
    func testFromPositiveUniform() {
        let duration = Duration(2).months
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeUniform() {
        let duration = Duration(-2).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueUniform() {
        let duration = Duration(0).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .months)
        XCTAssertEqual(duration?.count, 0)
    }
}
