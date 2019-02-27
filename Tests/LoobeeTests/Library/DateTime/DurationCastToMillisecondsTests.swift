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

internal final class DurationCastToMillisecondsTests: XCTestCase {
    ///
    func testFromPositiveNanoseconds() {
        let duration = Duration.nanoseconds(2000000).milliseconds
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeNanoseconds() {
        let duration = Duration.nanoseconds(-2000000).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueNanoseconds() {
        let duration = Duration.nanoseconds(0).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromNanosecondsPrecisionLoss() {
        let duration = Duration.nanoseconds(1999999).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveMicroseconds() {
        let duration = Duration.microseconds(2000).milliseconds
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeMicroseconds() {
        let duration = Duration.microseconds(-2000).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueMicroseconds() {
        let duration = Duration.microseconds(0).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMicrosecondsPrecisionLoss() {
        let duration = Duration.microseconds(1999).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveMilliseconds() {
        let duration = Duration.milliseconds(2).milliseconds
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeMilliseconds() {
        let duration = Duration.milliseconds(-2).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueMilliseconds() {
        let duration = Duration.milliseconds(0).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromPositiveSeconds() {
        let duration = Duration.seconds(2).milliseconds
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, 2000)
    }

    ///
    func testFromNegativeSeconds() {
        let duration = Duration.seconds(-2).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, -2000)
    }

    ///
    func testFromZeroValueSeconds() {
        let duration = Duration.seconds(0).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromSecondsOverflow() {
        XCTAssertNil(Duration.seconds(Int64.max).milliseconds)
    }

    ///
    func testFromPositiveMinutes() {
        let duration = Duration.minutes(2).milliseconds
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, 120000)
    }

    ///
    func testFromNegativeMinutes() {
        let duration = Duration.minutes(-2).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, -120000)
    }

    ///
    func testFromZeroValueMinutes() {
        let duration = Duration.minutes(0).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMinutesOverflow() {
        XCTAssertNil(Duration.minutes(Int64.max).milliseconds)
    }

    ///
    func testFromPositiveHours() {
        let duration = Duration.hours(2).milliseconds
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, 7200000)
    }

    ///
    func testFromNegativeHours() {
        let duration = Duration.hours(-2).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, -7200000)
    }

    ///
    func testFromZeroValueHours() {
        let duration = Duration.hours(0).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromHoursOverflow() {
        XCTAssertNil(Duration.hours(Int64.max).milliseconds)
    }

    ///
    func testFromPositiveDays() {
        let duration = Duration.days(2).milliseconds
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, 172800000)
    }

    ///
    func testFromNegativeDays() {
        let duration = Duration.days(-2).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, -172800000)
    }

    ///
    func testFromZeroValueDays() {
        let duration = Duration.days(0).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromDaysOverflow() {
        XCTAssertNil(Duration.days(Int64.max).milliseconds)
    }

    ///
    func testFromPositiveWeeks() {
        let duration = Duration.weeks(2).milliseconds
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, 1209600000)
    }

    ///
    func testFromNegativeWeeks() {
        let duration = Duration.weeks(-2).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, -1209600000)
    }

    ///
    func testFromZeroValueWeeks() {
        let duration = Duration.weeks(0).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromWeeksOverflow() {
        XCTAssertNil(Duration.weeks(Int64.max).milliseconds)
    }

    ///
    func testFromPositiveMonths() {
        let duration = Duration.months(2).milliseconds
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, 5259492000)
    }

    ///
    func testFromNegativeMonths() {
        let duration = Duration.months(-2).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, -5259492000)
    }

    ///
    func testFromZeroValueMonths() {
        let duration = Duration.months(0).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMonthsOverflow() {
        XCTAssertNil(Duration.months(Int64.max).milliseconds)
    }

    ///
    func testFromPositiveYears() {
        let duration = Duration.years(2).milliseconds
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, 63113904000)
    }

    ///
    func testFromNegativeYears() {
        let duration = Duration.years(-2).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, -63113904000)
    }

    ///
    func testFromZeroValueYears() {
        let duration = Duration.years(0).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromYearsOverflow() {
        XCTAssertNil(Duration.years(Int64.max).milliseconds)
    }

    ///
    func testFromPositiveUniform() {
        let duration = Duration(2).milliseconds
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeUniform() {
        let duration = Duration(-2).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueUniform() {
        let duration = Duration(0).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .milliseconds)
        XCTAssertEqual(duration?.count, 0)
    }
}
