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

internal final class DurationCastToWeeksTests: XCTestCase {
    ///
    func testFromPositiveNanoseconds() {
        let duration = Duration.nanoseconds(1209600000000000).weeks
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeNanoseconds() {
        let duration = Duration.nanoseconds(-1209600000000000).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueNanoseconds() {
        let duration = Duration.nanoseconds(0).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromNanosecondsPrecisionLoss() {
        let duration = Duration.nanoseconds(1209599999999999).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveMicroseconds() {
        let duration = Duration.microseconds(1209600000000).weeks
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeMicroseconds() {
        let duration = Duration.microseconds(-1209600000000).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueMicroseconds() {
        let duration = Duration.microseconds(0).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMicrosecondsPrecisionLoss() {
        let duration = Duration.microseconds(1209599999999).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveMilliseconds() {
        let duration = Duration.milliseconds(1209600000).weeks
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeMilliseconds() {
        let duration = Duration.milliseconds(-1209600000).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueMilliseconds() {
        let duration = Duration.milliseconds(0).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMillisecondsPrecisionLoss() {
        let duration = Duration.milliseconds(1209599999).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveSeconds() {
        let duration = Duration.seconds(1209600).weeks
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeSeconds() {
        let duration = Duration.seconds(-1209600).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueSeconds() {
        let duration = Duration.seconds(0).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromSecondsPrecisionLoss() {
        let duration = Duration.seconds(1209599).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveMinutes() {
        let duration = Duration.minutes(20160).weeks
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeMinutes() {
        let duration = Duration.minutes(-20160).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueMinutes() {
        let duration = Duration.minutes(0).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMinutesPrecisionLoss() {
        let duration = Duration.minutes(20159).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveHours() {
        let duration = Duration.hours(336).weeks
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeHours() {
        let duration = Duration.hours(-336).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueHours() {
        let duration = Duration.hours(0).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromHoursPrecisionLoss() {
        let duration = Duration.hours(335).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveDays() {
        let duration = Duration.days(14).weeks
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeDays() {
        let duration = Duration.days(-14).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueDays() {
        let duration = Duration.days(0).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromDaysPrecisionLoss() {
        let duration = Duration.days(13).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testFromPositiveWeeks() {
        let duration = Duration.weeks(2).weeks
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeWeeks() {
        let duration = Duration.weeks(-2).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueWeeks() {
        let duration = Duration.weeks(0).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromPositiveMonths() {
        let duration = Duration.months(2).weeks
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 8)
    }

    ///
    func testFromNegativeMonths() {
        let duration = Duration.months(-2).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, -8)
    }

    ///
    func testFromZeroValueMonths() {
        let duration = Duration.months(0).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromMonthsOverflow() {
        XCTAssertNil(Duration.months(Int64.max).weeks)
    }

    ///
    func testFromPositiveYears() {
        let duration = Duration.years(2).weeks
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 104)
    }

    ///
    func testFromNegativeYears() {
        let duration = Duration.years(-2).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, -104)
    }

    ///
    func testFromZeroValueYears() {
        let duration = Duration.years(0).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testFromYearsOverflow() {
        XCTAssertNil(Duration.years(Int64.max).weeks)
    }

    ///
    func testFromPositiveUniform() {
        let duration = Duration(2).weeks
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testFromNegativeUniform() {
        let duration = Duration(-2).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, -2)
    }

    ///
    func testFromZeroValueUniform() {
        let duration = Duration(0).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.unit, .weeks)
        XCTAssertEqual(duration?.count, 0)
    }
}
