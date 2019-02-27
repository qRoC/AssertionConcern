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

internal final class DurationCastToSecondsTests: XCTestCase {
    ///
    func testFromPositiveNanoseconds() {
        let duration = Duration.nanoseconds(2000000000).seconds
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeNanoseconds() {
        let duration = Duration.nanoseconds(-2000000000).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueNanoseconds() {
        let duration = Duration.nanoseconds(0).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromNanosecondsPrecisionLoss() {
        let duration = Duration.nanoseconds(1999999999).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveMicroseconds() {
        let duration = Duration.microseconds(2000000).seconds
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeMicroseconds() {
        let duration = Duration.microseconds(-2000000).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueMicroseconds() {
        let duration = Duration.microseconds(0).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMicrosecondsPrecisionLoss() {
        let duration = Duration.microseconds(1999999).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveMilliseconds() {
        let duration = Duration.milliseconds(2000).seconds
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeMilliseconds() {
        let duration = Duration.milliseconds(-2000).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueMilliseconds() {
        let duration = Duration.milliseconds(0).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMillisecondsPrecisionLoss() {
        let duration = Duration.milliseconds(1999).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveSeconds() {
        let duration = Duration.seconds(2).seconds
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeSeconds() {
        let duration = Duration.seconds(-2).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueSeconds() {
        let duration = Duration.seconds(0).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromPositiveMinutes() {
        let duration = Duration.minutes(2).seconds
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, 120)
    }

    ///
    func testFromNegativeMinutes() {
        let duration = Duration.minutes(-2).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, -120)
    }

    ///
    func testFromZeroValueMinutes() {
        let duration = Duration.minutes(0).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMinutesOverflow() {
        XCTAssertNil(Duration.minutes(Int64.max).seconds)
    }

    ///
    func testFromPositiveHours() {
        let duration = Duration.hours(2).seconds
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, 7200)
    }

    ///
    func testFromNegativeHours() {
        let duration = Duration.hours(-2).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, -7200)
    }

    ///
    func testFromZeroValueHours() {
        let duration = Duration.hours(0).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromHoursOverflow() {
        XCTAssertNil(Duration.hours(Int64.max).seconds)
    }

    ///
    func testFromPositiveDays() {
        let duration = Duration.days(2).seconds
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, 172800)
    }

    ///
    func testFromNegativeDays() {
        let duration = Duration.days(-2).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, -172800)
    }

    ///
    func testFromZeroValueDays() {
        let duration = Duration.days(0).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromDaysOverflow() {
        XCTAssertNil(Duration.days(Int64.max).seconds)
    }

    ///
    func testFromPositiveWeeks() {
        let duration = Duration.weeks(2).seconds
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, 1209600)
    }

    ///
    func testFromNegativeWeeks() {
        let duration = Duration.weeks(-2).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, -1209600)
    }

    ///
    func testFromZeroValueWeeks() {
        let duration = Duration.weeks(0).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromWeeksOverflow() {
        XCTAssertNil(Duration.weeks(Int64.max).seconds)
    }

    ///
    func testFromPositiveMonths() {
        let duration = Duration.months(2).seconds
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, 5259492)
    }

    ///
    func testFromNegativeMonths() {
        let duration = Duration.months(-2).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, -5259492)
    }

    ///
    func testFromZeroValueMonths() {
        let duration = Duration.months(0).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMonthsOverflow() {
        XCTAssertNil(Duration.months(Int64.max).seconds)
    }

    ///
    func testFromPositiveYears() {
        let duration = Duration.years(2).seconds
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, 63113904)
    }

    ///
    func testFromNegativeYears() {
        let duration = Duration.years(-2).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, -63113904)
    }

    ///
    func testFromZeroValueYears() {
        let duration = Duration.years(0).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromYearsOverflow() {
        XCTAssertNil(Duration.years(Int64.max).seconds)
    }

    ///
    func testFromPositiveUniform() {
        let duration = Duration(2).seconds
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeUniform() {
        let duration = Duration(-2).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueUniform() {
        let duration = Duration(0).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .seconds)
        XCTAssertEqual(duration?.count, 0)
    }
}
