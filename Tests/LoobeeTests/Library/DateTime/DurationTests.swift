// This file is part of the Loobee package.
//
// (c) Andrey Savitsky <contact@qroc.pro>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import XCTest
#if canImport(Loobee)
import Loobee
#else
import LoobeeDateTime
#endif

internal final class DurationTests: XCTestCase {
    ///
    func testCountOfNanoseconds() {
        XCTAssertEqual(Duration.nanoseconds(123).count, 123)
    }

    ///
    func testCountOfMicroseconds() {
        XCTAssertEqual(Duration.microseconds(123).count, 123)
    }

    ///
    func testCountOfMilliseconds() {
        XCTAssertEqual(Duration.milliseconds(123).count, 123)
    }

    ///
    func testCountOfSeconds() {
        XCTAssertEqual(Duration.seconds(123).count, 123)
    }

    ///
    func testCountOfMinutes() {
        XCTAssertEqual(Duration.minutes(123).count, 123)
    }

    ///
    func testCountOfHours() {
        XCTAssertEqual(Duration.hours(123).count, 123)
    }

    ///
    func testCountOfDays() {
        XCTAssertEqual(Duration.days(123).count, 123)
    }

    ///
    func testCountOfWeeks() {
        XCTAssertEqual(Duration.weeks(123).count, 123)
    }

    ///
    func testCountOfMonths() {
        XCTAssertEqual(Duration.months(123).count, 123)
    }

    ///
    func testCountOfYears() {
        XCTAssertEqual(Duration.years(123).count, 123)
    }

    ///
    func testCastToNanosecondsFromNanoseconds() {
        guard let result = Duration.nanoseconds(2).nanoseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .nanoseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToNanosecondsFromNanosecondsZeroValue() {
        guard let result = Duration.nanoseconds(0).nanoseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .nanoseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToNanosecondsFromMicroseconds() {
        guard let result = Duration.microseconds(2).nanoseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .nanoseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2000)
    }

    ///
    func testCastToNanosecondsFromMicrosecondsZeroValue() {
        guard let result = Duration.microseconds(0).nanoseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .nanoseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToNanosecondsFromMicrosecondsOverflow() {
        XCTAssertNil(Duration.microseconds(Int64.max).nanoseconds)
    }

    ///
    func testCastToNanosecondsFromMilliseconds() {
        guard let result = Duration.milliseconds(2).nanoseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .nanoseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2000000)
    }

    ///
    func testCastToNanosecondsFromMillisecondsZeroValue() {
        guard let result = Duration.milliseconds(0).nanoseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .nanoseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToNanosecondsFromMillisecondsOverflow() {
        XCTAssertNil(Duration.milliseconds(Int64.max).nanoseconds)
    }

    ///
    func testCastToNanosecondsFromSeconds() {
        guard let result = Duration.seconds(2).nanoseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .nanoseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2000000000)
    }

    ///
    func testCastToNanosecondsFromSecondsZeroValue() {
        guard let result = Duration.seconds(0).nanoseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .nanoseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToNanosecondsFromSecondsOverflow() {
        XCTAssertNil(Duration.seconds(Int64.max).nanoseconds)
    }

    ///
    func testCastToNanosecondsFromMinutes() {
        guard let result = Duration.minutes(2).nanoseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .nanoseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 120000000000)
    }

    ///
    func testCastToNanosecondsFromMinutesZeroValue() {
        guard let result = Duration.minutes(0).nanoseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .nanoseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToNanosecondsFromMinutesOverflow() {
        XCTAssertNil(Duration.minutes(Int64.max).nanoseconds)
    }

    ///
    func testCastToNanosecondsFromHours() {
        guard let result = Duration.hours(2).nanoseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .nanoseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 7200000000000)
    }

    ///
    func testCastToNanosecondsFromHoursZeroValue() {
        guard let result = Duration.hours(0).nanoseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .nanoseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToNanosecondsFromHoursOverflow() {
        XCTAssertNil(Duration.hours(Int64.max).nanoseconds)
    }

    ///
    func testCastToNanosecondsFromDays() {
        guard let result = Duration.days(2).nanoseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .nanoseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 172800000000000)
    }

    ///
    func testCastToNanosecondsFromDaysZeroValue() {
        guard let result = Duration.days(0).nanoseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .nanoseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToNanosecondsFromDaysOverflow() {
        XCTAssertNil(Duration.days(Int64.max).nanoseconds)
    }

    ///
    func testCastToNanosecondsFromWeeks() {
        guard let result = Duration.weeks(2).nanoseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .nanoseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1209600000000000)
    }

    ///
    func testCastToNanosecondsFromWeeksZeroValue() {
        guard let result = Duration.weeks(0).nanoseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .nanoseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToNanosecondsFromWeeksOverflow() {
        XCTAssertNil(Duration.weeks(Int64.max).nanoseconds)
    }

    ///
    func testCastToNanosecondsFromMonths() {
        guard let result = Duration.months(2).nanoseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .nanoseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 5259492000000000)
    }

    ///
    func testCastToNanosecondsFromMonthsZeroValue() {
        guard let result = Duration.months(0).nanoseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .nanoseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToNanosecondsFromMonthsOverflow() {
        XCTAssertNil(Duration.months(Int64.max).nanoseconds)
    }

    ///
    func testCastToNanosecondsFromYears() {
        guard let result = Duration.years(2).nanoseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .nanoseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 63113904000000000)
    }

    ///
    func testCastToNanosecondsFromYearsZeroValue() {
        guard let result = Duration.years(0).nanoseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .nanoseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToNanosecondsFromYearsOverflow() {
        XCTAssertNil(Duration.years(Int64.max).nanoseconds)
    }

    ///
    func testCastToMicrosecondsFromNanoseconds() {
        guard let result = Duration.nanoseconds(2000).microseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .microseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToMicrosecondsFromNanosecondsZeroValue() {
        guard let result = Duration.nanoseconds(0).microseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .microseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMicrosecondsFromNanosecondsPrecisionLoss() {
        guard let result = Duration.nanoseconds(1999).microseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .microseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToMicrosecondsFromMicroseconds() {
        guard let result = Duration.microseconds(2).microseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .microseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToMicrosecondsFromMicrosecondsZeroValue() {
        guard let result = Duration.microseconds(0).microseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .microseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMicrosecondsFromMilliseconds() {
        guard let result = Duration.milliseconds(2).microseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .microseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2000)
    }

    ///
    func testCastToMicrosecondsFromMillisecondsZeroValue() {
        guard let result = Duration.milliseconds(0).microseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .microseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMicrosecondsFromMillisecondsOverflow() {
        XCTAssertNil(Duration.milliseconds(Int64.max).microseconds)
    }

    ///
    func testCastToMicrosecondsFromSeconds() {
        guard let result = Duration.seconds(2).microseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .microseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2000000)
    }

    ///
    func testCastToMicrosecondsFromSecondsZeroValue() {
        guard let result = Duration.seconds(0).microseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .microseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMicrosecondsFromSecondsOverflow() {
        XCTAssertNil(Duration.seconds(Int64.max).microseconds)
    }

    ///
    func testCastToMicrosecondsFromMinutes() {
        guard let result = Duration.minutes(2).microseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .microseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 120000000)
    }

    ///
    func testCastToMicrosecondsFromMinutesZeroValue() {
        guard let result = Duration.minutes(0).microseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .microseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMicrosecondsFromMinutesOverflow() {
        XCTAssertNil(Duration.minutes(Int64.max).microseconds)
    }

    ///
    func testCastToMicrosecondsFromHours() {
        guard let result = Duration.hours(2).microseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .microseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 7200000000)
    }

    ///
    func testCastToMicrosecondsFromHoursZeroValue() {
        guard let result = Duration.hours(0).microseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .microseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMicrosecondsFromHoursOverflow() {
        XCTAssertNil(Duration.hours(Int64.max).microseconds)
    }

    ///
    func testCastToMicrosecondsFromDays() {
        guard let result = Duration.days(2).microseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .microseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 172800000000)
    }

    ///
    func testCastToMicrosecondsFromDaysZeroValue() {
        guard let result = Duration.days(0).microseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .microseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMicrosecondsFromDaysOverflow() {
        XCTAssertNil(Duration.days(Int64.max).microseconds)
    }

    ///
    func testCastToMicrosecondsFromWeeks() {
        guard let result = Duration.weeks(2).microseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .microseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1209600000000)
    }

    ///
    func testCastToMicrosecondsFromWeeksZeroValue() {
        guard let result = Duration.weeks(0).microseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .microseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMicrosecondsFromWeeksOverflow() {
        XCTAssertNil(Duration.weeks(Int64.max).microseconds)
    }

    ///
    func testCastToMicrosecondsFromMonths() {
        guard let result = Duration.months(2).microseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .microseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 5259492000000)
    }

    ///
    func testCastToMicrosecondsFromMonthsZeroValue() {
        guard let result = Duration.months(0).microseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .microseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMicrosecondsFromMonthsOverflow() {
        XCTAssertNil(Duration.months(Int64.max).microseconds)
    }

    ///
    func testCastToMicrosecondsFromYears() {
        guard let result = Duration.years(2).microseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .microseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 63113904000000)
    }

    ///
    func testCastToMicrosecondsFromYearsZeroValue() {
        guard let result = Duration.years(0).microseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .microseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMicrosecondsFromYearsOverflow() {
        XCTAssertNil(Duration.years(Int64.max).microseconds)
    }

    ///
    func testCastToMillisecondsFromNanoseconds() {
        guard let result = Duration.nanoseconds(2000000).milliseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .milliseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToMillisecondsFromNanosecondsZeroValue() {
        guard let result = Duration.nanoseconds(0).milliseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .milliseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMillisecondsFromNanosecondsPrecisionLoss() {
        guard let result = Duration.nanoseconds(1999999).milliseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .milliseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToMillisecondsFromMicroseconds() {
        guard let result = Duration.microseconds(2000).milliseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .milliseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToMillisecondsFromMicrosecondsZeroValue() {
        guard let result = Duration.microseconds(0).milliseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .milliseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMillisecondsFromMicrosecondsPrecisionLoss() {
        guard let result = Duration.microseconds(1999).milliseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .milliseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToMillisecondsFromMilliseconds() {
        guard let result = Duration.milliseconds(2).milliseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .milliseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToMillisecondsFromMillisecondsZeroValue() {
        guard let result = Duration.milliseconds(0).milliseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .milliseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMillisecondsFromSeconds() {
        guard let result = Duration.seconds(2).milliseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .milliseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2000)
    }

    ///
    func testCastToMillisecondsFromSecondsZeroValue() {
        guard let result = Duration.seconds(0).milliseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .milliseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMillisecondsFromSecondsOverflow() {
        XCTAssertNil(Duration.seconds(Int64.max).milliseconds)
    }

    ///
    func testCastToMillisecondsFromMinutes() {
        guard let result = Duration.minutes(2).milliseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .milliseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 120000)
    }

    ///
    func testCastToMillisecondsFromMinutesZeroValue() {
        guard let result = Duration.minutes(0).milliseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .milliseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMillisecondsFromMinutesOverflow() {
        XCTAssertNil(Duration.minutes(Int64.max).milliseconds)
    }

    ///
    func testCastToMillisecondsFromHours() {
        guard let result = Duration.hours(2).milliseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .milliseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 7200000)
    }

    ///
    func testCastToMillisecondsFromHoursZeroValue() {
        guard let result = Duration.hours(0).milliseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .milliseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMillisecondsFromHoursOverflow() {
        XCTAssertNil(Duration.hours(Int64.max).milliseconds)
    }

    ///
    func testCastToMillisecondsFromDays() {
        guard let result = Duration.days(2).milliseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .milliseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 172800000)
    }

    ///
    func testCastToMillisecondsFromDaysZeroValue() {
        guard let result = Duration.days(0).milliseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .milliseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMillisecondsFromDaysOverflow() {
        XCTAssertNil(Duration.days(Int64.max).milliseconds)
    }

    ///
    func testCastToMillisecondsFromWeeks() {
        guard let result = Duration.weeks(2).milliseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .milliseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1209600000)
    }

    ///
    func testCastToMillisecondsFromWeeksZeroValue() {
        guard let result = Duration.weeks(0).milliseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .milliseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMillisecondsFromWeeksOverflow() {
        XCTAssertNil(Duration.weeks(Int64.max).milliseconds)
    }

    ///
    func testCastToMillisecondsFromMonths() {
        guard let result = Duration.months(2).milliseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .milliseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 5259492000)
    }

    ///
    func testCastToMillisecondsFromMonthsZeroValue() {
        guard let result = Duration.months(0).milliseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .milliseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMillisecondsFromMonthsOverflow() {
        XCTAssertNil(Duration.months(Int64.max).milliseconds)
    }

    ///
    func testCastToMillisecondsFromYears() {
        guard let result = Duration.years(2).milliseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .milliseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 63113904000)
    }

    ///
    func testCastToMillisecondsFromYearsZeroValue() {
        guard let result = Duration.years(0).milliseconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .milliseconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMillisecondsFromYearsOverflow() {
        XCTAssertNil(Duration.years(Int64.max).milliseconds)
    }

    ///
    func testCastToSecondsFromNanoseconds() {
        guard let result = Duration.nanoseconds(2000000000).seconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .seconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToSecondsFromNanosecondsZeroValue() {
        guard let result = Duration.nanoseconds(0).seconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .seconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToSecondsFromNanosecondsPrecisionLoss() {
        guard let result = Duration.nanoseconds(1999999999).seconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .seconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToSecondsFromMicroseconds() {
        guard let result = Duration.microseconds(2000000).seconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .seconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToSecondsFromMicrosecondsZeroValue() {
        guard let result = Duration.microseconds(0).seconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .seconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToSecondsFromMicrosecondsPrecisionLoss() {
        guard let result = Duration.microseconds(1999999).seconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .seconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToSecondsFromMilliseconds() {
        guard let result = Duration.milliseconds(2000).seconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .seconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToSecondsFromMillisecondsZeroValue() {
        guard let result = Duration.milliseconds(0).seconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .seconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToSecondsFromMillisecondsPrecisionLoss() {
        guard let result = Duration.milliseconds(1999).seconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .seconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToSecondsFromSeconds() {
        guard let result = Duration.seconds(2).seconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .seconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToSecondsFromSecondsZeroValue() {
        guard let result = Duration.seconds(0).seconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .seconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToSecondsFromMinutes() {
        guard let result = Duration.minutes(2).seconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .seconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 120)
    }

    ///
    func testCastToSecondsFromMinutesZeroValue() {
        guard let result = Duration.minutes(0).seconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .seconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToSecondsFromMinutesOverflow() {
        XCTAssertNil(Duration.minutes(Int64.max).seconds)
    }

    ///
    func testCastToSecondsFromHours() {
        guard let result = Duration.hours(2).seconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .seconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 7200)
    }

    ///
    func testCastToSecondsFromHoursZeroValue() {
        guard let result = Duration.hours(0).seconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .seconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToSecondsFromHoursOverflow() {
        XCTAssertNil(Duration.hours(Int64.max).seconds)
    }

    ///
    func testCastToSecondsFromDays() {
        guard let result = Duration.days(2).seconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .seconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 172800)
    }

    ///
    func testCastToSecondsFromDaysZeroValue() {
        guard let result = Duration.days(0).seconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .seconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToSecondsFromDaysOverflow() {
        XCTAssertNil(Duration.days(Int64.max).seconds)
    }

    ///
    func testCastToSecondsFromWeeks() {
        guard let result = Duration.weeks(2).seconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .seconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1209600)
    }

    ///
    func testCastToSecondsFromWeeksZeroValue() {
        guard let result = Duration.weeks(0).seconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .seconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToSecondsFromWeeksOverflow() {
        XCTAssertNil(Duration.weeks(Int64.max).seconds)
    }

    ///
    func testCastToSecondsFromMonths() {
        guard let result = Duration.months(2).seconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .seconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 5259492)
    }

    ///
    func testCastToSecondsFromMonthsZeroValue() {
        guard let result = Duration.months(0).seconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .seconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToSecondsFromMonthsOverflow() {
        XCTAssertNil(Duration.months(Int64.max).seconds)
    }

    ///
    func testCastToSecondsFromYears() {
        guard let result = Duration.years(2).seconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .seconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 63113904)
    }

    ///
    func testCastToSecondsFromYearsZeroValue() {
        guard let result = Duration.years(0).seconds else {
            XCTFail("Value is nil.")
            return
        }

        guard case .seconds = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToSecondsFromYearsOverflow() {
        XCTAssertNil(Duration.years(Int64.max).seconds)
    }

    ///
    func testCastToMinutesFromNanoseconds() {
        guard let result = Duration.nanoseconds(120000000000).minutes else {
            XCTFail("Value is nil.")
            return
        }

        guard case .minutes = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToMinutesFromNanosecondsZeroValue() {
        guard let result = Duration.nanoseconds(0).minutes else {
            XCTFail("Value is nil.")
            return
        }

        guard case .minutes = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMinutesFromNanosecondsPrecisionLoss() {
        guard let result = Duration.nanoseconds(119999999999).minutes else {
            XCTFail("Value is nil.")
            return
        }

        guard case .minutes = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToMinutesFromMicroseconds() {
        guard let result = Duration.microseconds(120000000).minutes else {
            XCTFail("Value is nil.")
            return
        }

        guard case .minutes = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToMinutesFromMicrosecondsZeroValue() {
        guard let result = Duration.microseconds(0).minutes else {
            XCTFail("Value is nil.")
            return
        }

        guard case .minutes = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMinutesFromMicrosecondsPrecisionLoss() {
        guard let result = Duration.microseconds(119999999).minutes else {
            XCTFail("Value is nil.")
            return
        }

        guard case .minutes = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToMinutesFromMilliseconds() {
        guard let result = Duration.milliseconds(120000).minutes else {
            XCTFail("Value is nil.")
            return
        }

        guard case .minutes = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToMinutesFromMillisecondsZeroValue() {
        guard let result = Duration.milliseconds(0).minutes else {
            XCTFail("Value is nil.")
            return
        }

        guard case .minutes = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMinutesFromMillisecondsPrecisionLoss() {
        guard let result = Duration.milliseconds(119999).minutes else {
            XCTFail("Value is nil.")
            return
        }

        guard case .minutes = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToMinutesFromSeconds() {
        guard let result = Duration.seconds(120).minutes else {
            XCTFail("Value is nil.")
            return
        }

        guard case .minutes = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToMinutesFromSecondsZeroValue() {
        guard let result = Duration.seconds(0).minutes else {
            XCTFail("Value is nil.")
            return
        }

        guard case .minutes = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMinutesFromSecondsPrecisionLoss() {
        guard let result = Duration.seconds(119).minutes else {
            XCTFail("Value is nil.")
            return
        }

        guard case .minutes = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToMinutesFromMinutes() {
        guard let result = Duration.minutes(2).minutes else {
            XCTFail("Value is nil.")
            return
        }

        guard case .minutes = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToMinutesFromMinutesZeroValue() {
        guard let result = Duration.minutes(0).minutes else {
            XCTFail("Value is nil.")
            return
        }

        guard case .minutes = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMinutesFromHours() {
        guard let result = Duration.hours(2).minutes else {
            XCTFail("Value is nil.")
            return
        }

        guard case .minutes = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 120)
    }

    ///
    func testCastToMinutesFromHoursZeroValue() {
        guard let result = Duration.hours(0).minutes else {
            XCTFail("Value is nil.")
            return
        }

        guard case .minutes = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMinutesFromHoursOverflow() {
        XCTAssertNil(Duration.hours(Int64.max).minutes)
    }

    ///
    func testCastToMinutesFromDays() {
        guard let result = Duration.days(2).minutes else {
            XCTFail("Value is nil.")
            return
        }

        guard case .minutes = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2880)
    }

    ///
    func testCastToMinutesFromDaysZeroValue() {
        guard let result = Duration.days(0).minutes else {
            XCTFail("Value is nil.")
            return
        }

        guard case .minutes = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMinutesFromDaysOverflow() {
        XCTAssertNil(Duration.days(Int64.max).minutes)
    }

    ///
    func testCastToMinutesFromWeeks() {
        guard let result = Duration.weeks(2).minutes else {
            XCTFail("Value is nil.")
            return
        }

        guard case .minutes = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 20160)
    }

    ///
    func testCastToMinutesFromWeeksZeroValue() {
        guard let result = Duration.weeks(0).minutes else {
            XCTFail("Value is nil.")
            return
        }

        guard case .minutes = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMinutesFromWeeksOverflow() {
        XCTAssertNil(Duration.weeks(Int64.max).minutes)
    }

    ///
    func testCastToMinutesFromMonths() {
        guard let result = Duration.months(2).minutes else {
            XCTFail("Value is nil.")
            return
        }

        guard case .minutes = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 87658)
    }

    ///
    func testCastToMinutesFromMonthsZeroValue() {
        guard let result = Duration.months(0).minutes else {
            XCTFail("Value is nil.")
            return
        }

        guard case .minutes = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMinutesFromMonthsOverflow() {
        XCTAssertNil(Duration.months(Int64.max).minutes)
    }

    ///
    func testCastToMinutesFromYears() {
        guard let result = Duration.years(2).minutes else {
            XCTFail("Value is nil.")
            return
        }

        guard case .minutes = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1051898)
    }

    ///
    func testCastToMinutesFromYearsZeroValue() {
        guard let result = Duration.years(0).minutes else {
            XCTFail("Value is nil.")
            return
        }

        guard case .minutes = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMinutesFromYearsOverflow() {
        XCTAssertNil(Duration.years(Int64.max).minutes)
    }

    ///
    func testCastToHoursFromNanoseconds() {
        guard let result = Duration.nanoseconds(7200000000000).hours else {
            XCTFail("Value is nil.")
            return
        }

        guard case .hours = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToHoursFromNanosecondsZeroValue() {
        guard let result = Duration.nanoseconds(0).hours else {
            XCTFail("Value is nil.")
            return
        }

        guard case .hours = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToHoursFromNanosecondsPrecisionLoss() {
        guard let result = Duration.nanoseconds(7199999999999).hours else {
            XCTFail("Value is nil.")
            return
        }

        guard case .hours = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToHoursFromMicroseconds() {
        guard let result = Duration.microseconds(7200000000).hours else {
            XCTFail("Value is nil.")
            return
        }

        guard case .hours = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToHoursFromMicrosecondsZeroValue() {
        guard let result = Duration.microseconds(0).hours else {
            XCTFail("Value is nil.")
            return
        }

        guard case .hours = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToHoursFromMicrosecondsPrecisionLoss() {
        guard let result = Duration.microseconds(7199999999).hours else {
            XCTFail("Value is nil.")
            return
        }

        guard case .hours = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToHoursFromMilliseconds() {
        guard let result = Duration.milliseconds(7200000).hours else {
            XCTFail("Value is nil.")
            return
        }

        guard case .hours = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToHoursFromMillisecondsZeroValue() {
        guard let result = Duration.milliseconds(0).hours else {
            XCTFail("Value is nil.")
            return
        }

        guard case .hours = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToHoursFromMillisecondsPrecisionLoss() {
        guard let result = Duration.milliseconds(7199999).hours else {
            XCTFail("Value is nil.")
            return
        }

        guard case .hours = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToHoursFromSeconds() {
        guard let result = Duration.seconds(7200).hours else {
            XCTFail("Value is nil.")
            return
        }

        guard case .hours = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToHoursFromSecondsZeroValue() {
        guard let result = Duration.seconds(0).hours else {
            XCTFail("Value is nil.")
            return
        }

        guard case .hours = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToHoursFromSecondsPrecisionLoss() {
        guard let result = Duration.seconds(7199).hours else {
            XCTFail("Value is nil.")
            return
        }

        guard case .hours = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToHoursFromMinutes() {
        guard let result = Duration.minutes(120).hours else {
            XCTFail("Value is nil.")
            return
        }

        guard case .hours = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToHoursFromMinutesZeroValue() {
        guard let result = Duration.minutes(0).hours else {
            XCTFail("Value is nil.")
            return
        }

        guard case .hours = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToHoursFromMinutesPrecisionLoss() {
        guard let result = Duration.minutes(119).hours else {
            XCTFail("Value is nil.")
            return
        }

        guard case .hours = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToHoursFromHours() {
        guard let result = Duration.hours(2).hours else {
            XCTFail("Value is nil.")
            return
        }

        guard case .hours = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToHoursFromHoursZeroValue() {
        guard let result = Duration.hours(0).hours else {
            XCTFail("Value is nil.")
            return
        }

        guard case .hours = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToHoursFromDays() {
        guard let result = Duration.days(2).hours else {
            XCTFail("Value is nil.")
            return
        }

        guard case .hours = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 48)
    }

    ///
    func testCastToHoursFromDaysZeroValue() {
        guard let result = Duration.days(0).hours else {
            XCTFail("Value is nil.")
            return
        }

        guard case .hours = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToHoursFromDaysOverflow() {
        XCTAssertNil(Duration.days(Int64.max).hours)
    }

    ///
    func testCastToHoursFromWeeks() {
        guard let result = Duration.weeks(2).hours else {
            XCTFail("Value is nil.")
            return
        }

        guard case .hours = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 336)
    }

    ///
    func testCastToHoursFromWeeksZeroValue() {
        guard let result = Duration.weeks(0).hours else {
            XCTFail("Value is nil.")
            return
        }

        guard case .hours = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToHoursFromWeeksOverflow() {
        XCTAssertNil(Duration.weeks(Int64.max).hours)
    }

    ///
    func testCastToHoursFromMonths() {
        guard let result = Duration.months(2).hours else {
            XCTFail("Value is nil.")
            return
        }

        guard case .hours = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1460)
    }

    ///
    func testCastToHoursFromMonthsZeroValue() {
        guard let result = Duration.months(0).hours else {
            XCTFail("Value is nil.")
            return
        }

        guard case .hours = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToHoursFromMonthsOverflow() {
        XCTAssertNil(Duration.months(Int64.max).hours)
    }

    ///
    func testCastToHoursFromYears() {
        guard let result = Duration.years(2).hours else {
            XCTFail("Value is nil.")
            return
        }

        guard case .hours = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 17531)
    }

    ///
    func testCastToHoursFromYearsZeroValue() {
        guard let result = Duration.years(0).hours else {
            XCTFail("Value is nil.")
            return
        }

        guard case .hours = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToHoursFromYearsOverflow() {
        XCTAssertNil(Duration.years(Int64.max).hours)
    }

    ///
    func testCastToDaysFromNanoseconds() {
        guard let result = Duration.nanoseconds(172800000000000).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToDaysFromNanosecondsZeroValue() {
        guard let result = Duration.nanoseconds(0).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToDaysFromNanosecondsPrecisionLoss() {
        guard let result = Duration.nanoseconds(172799999999999).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToDaysFromMicroseconds() {
        guard let result = Duration.microseconds(172800000000).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToDaysFromMicrosecondsZeroValue() {
        guard let result = Duration.microseconds(0).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToDaysFromMicrosecondsPrecisionLoss() {
        guard let result = Duration.microseconds(172799999999).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToDaysFromMilliseconds() {
        guard let result = Duration.milliseconds(172800000).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToDaysFromMillisecondsZeroValue() {
        guard let result = Duration.milliseconds(0).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToDaysFromMillisecondsPrecisionLoss() {
        guard let result = Duration.milliseconds(172799999).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToDaysFromSeconds() {
        guard let result = Duration.seconds(172800).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToDaysFromSecondsZeroValue() {
        guard let result = Duration.seconds(0).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToDaysFromSecondsPrecisionLoss() {
        guard let result = Duration.seconds(172799).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToDaysFromMinutes() {
        guard let result = Duration.minutes(2880).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToDaysFromMinutesZeroValue() {
        guard let result = Duration.minutes(0).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToDaysFromMinutesPrecisionLoss() {
        guard let result = Duration.minutes(2879).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToDaysFromHours() {
        guard let result = Duration.hours(48).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToDaysFromHoursZeroValue() {
        guard let result = Duration.hours(0).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToDaysFromHoursPrecisionLoss() {
        guard let result = Duration.hours(47).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToDaysFromDays() {
        guard let result = Duration.days(2).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToDaysFromDaysZeroValue() {
        guard let result = Duration.days(0).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToDaysFromWeeks() {
        guard let result = Duration.weeks(2).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 14)
    }

    ///
    func testCastToDaysFromWeeksZeroValue() {
        guard let result = Duration.weeks(0).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToDaysFromWeeksOverflow() {
        XCTAssertNil(Duration.weeks(Int64.max).days)
    }

    ///
    func testCastToDaysFromMonths() {
        guard let result = Duration.months(2).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 60)
    }

    ///
    func testCastToDaysFromMonthsZeroValue() {
        guard let result = Duration.months(0).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToDaysFromMonthsOverflow() {
        XCTAssertNil(Duration.months(Int64.max).days)
    }

    ///
    func testCastToDaysFromYears() {
        guard let result = Duration.years(2).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 730)
    }

    ///
    func testCastToDaysFromYearsZeroValue() {
        guard let result = Duration.years(0).days else {
            XCTFail("Value is nil.")
            return
        }

        guard case .days = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToDaysFromYearsOverflow() {
        XCTAssertNil(Duration.years(Int64.max).days)
    }

    ///
    func testCastToWeeksFromNanoseconds() {
        guard let result = Duration.nanoseconds(1209600000000000).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToWeeksFromNanosecondsZeroValue() {
        guard let result = Duration.nanoseconds(0).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToWeeksFromNanosecondsPrecisionLoss() {
        guard let result = Duration.nanoseconds(1209599999999999).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToWeeksFromMicroseconds() {
        guard let result = Duration.microseconds(1209600000000).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToWeeksFromMicrosecondsZeroValue() {
        guard let result = Duration.microseconds(0).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToWeeksFromMicrosecondsPrecisionLoss() {
        guard let result = Duration.microseconds(1209599999999).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToWeeksFromMilliseconds() {
        guard let result = Duration.milliseconds(1209600000).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToWeeksFromMillisecondsZeroValue() {
        guard let result = Duration.milliseconds(0).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToWeeksFromMillisecondsPrecisionLoss() {
        guard let result = Duration.milliseconds(1209599999).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToWeeksFromSeconds() {
        guard let result = Duration.seconds(1209600).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToWeeksFromSecondsZeroValue() {
        guard let result = Duration.seconds(0).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToWeeksFromSecondsPrecisionLoss() {
        guard let result = Duration.seconds(1209599).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToWeeksFromMinutes() {
        guard let result = Duration.minutes(20160).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToWeeksFromMinutesZeroValue() {
        guard let result = Duration.minutes(0).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToWeeksFromMinutesPrecisionLoss() {
        guard let result = Duration.minutes(20159).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToWeeksFromHours() {
        guard let result = Duration.hours(336).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToWeeksFromHoursZeroValue() {
        guard let result = Duration.hours(0).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToWeeksFromHoursPrecisionLoss() {
        guard let result = Duration.hours(335).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToWeeksFromDays() {
        guard let result = Duration.days(14).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToWeeksFromDaysZeroValue() {
        guard let result = Duration.days(0).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToWeeksFromDaysPrecisionLoss() {
        guard let result = Duration.days(13).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToWeeksFromWeeks() {
        guard let result = Duration.weeks(2).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToWeeksFromWeeksZeroValue() {
        guard let result = Duration.weeks(0).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToWeeksFromMonths() {
        guard let result = Duration.months(2).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 8)
    }

    ///
    func testCastToWeeksFromMonthsZeroValue() {
        guard let result = Duration.months(0).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToWeeksFromMonthsOverflow() {
        XCTAssertNil(Duration.months(Int64.max).weeks)
    }

    ///
    func testCastToWeeksFromYears() {
        guard let result = Duration.years(2).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 104)
    }

    ///
    func testCastToWeeksFromYearsZeroValue() {
        guard let result = Duration.years(0).weeks else {
            XCTFail("Value is nil.")
            return
        }

        guard case .weeks = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToWeeksFromYearsOverflow() {
        XCTAssertNil(Duration.years(Int64.max).weeks)
    }

    ///
    func testCastToMonthsFromNanoseconds() {
        guard let result = Duration.nanoseconds(5259492000000000).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToMonthsFromNanosecondsZeroValue() {
        guard let result = Duration.nanoseconds(0).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMonthsFromNanosecondsPrecisionLoss() {
        guard let result = Duration.nanoseconds(5259491999999999).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToMonthsFromMicroseconds() {
        guard let result = Duration.microseconds(5259492000000).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToMonthsFromMicrosecondsZeroValue() {
        guard let result = Duration.microseconds(0).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMonthsFromMicrosecondsPrecisionLoss() {
        guard let result = Duration.microseconds(5259491999999).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToMonthsFromMilliseconds() {
        guard let result = Duration.milliseconds(5259492000).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToMonthsFromMillisecondsZeroValue() {
        guard let result = Duration.milliseconds(0).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMonthsFromMillisecondsPrecisionLoss() {
        guard let result = Duration.milliseconds(5259491999).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToMonthsFromSeconds() {
        guard let result = Duration.seconds(5259492).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToMonthsFromSecondsZeroValue() {
        guard let result = Duration.seconds(0).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMonthsFromSecondsPrecisionLoss() {
        guard let result = Duration.seconds(5259491).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToMonthsFromMinutesLast() {
        guard let result = Duration.minutes(87658).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToMonthsFromMinutesFirst() {
        guard let result = Duration.minutes(87659).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToMonthsFromMinutesZeroValue() {
        guard let result = Duration.minutes(0).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMonthsFromMinutesPrecisionLoss() {
        guard let result = Duration.minutes(87657).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToMonthsFromHoursLast() {
        guard let result = Duration.hours(1460).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToMonthsFromHoursFirst() {
        guard let result = Duration.hours(1461).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToMonthsFromHoursZeroValue() {
        guard let result = Duration.hours(0).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMonthsFromHoursPrecisionLoss() {
        guard let result = Duration.hours(1459).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToMonthsFromDaysLast() {
        guard let result = Duration.days(60).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToMonthsFromDaysFirst() {
        guard let result = Duration.days(61).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToMonthsFromDaysZeroValue() {
        guard let result = Duration.days(0).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMonthsFromDaysPrecisionLoss() {
        guard let result = Duration.days(59).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToMonthsFromWeeksLast() {
        guard let result = Duration.weeks(8).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToMonthsFromWeeksFirst() {
        guard let result = Duration.weeks(9).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToMonthsFromWeeksZeroValue() {
        guard let result = Duration.weeks(0).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMonthsFromWeeksPrecisionLoss() {
        guard let result = Duration.weeks(7).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToMonthsFromMonths() {
        guard let result = Duration.months(2).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToMonthsFromMonthsZeroValue() {
        guard let result = Duration.months(0).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMonthsFromYears() {
        guard let result = Duration.years(2).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 24)
    }

    ///
    func testCastToMonthsFromYearsZeroValue() {
        guard let result = Duration.years(0).months else {
            XCTFail("Value is nil.")
            return
        }

        guard case .months = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToMonthsFromYearsOverflow() {
        XCTAssertNil(Duration.years(Int64.max).months)
    }

    ///
    func testCastToYearsFromNanoseconds() {
        guard let result = Duration.nanoseconds(63113904000000000).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToYearsFromNanosecondsZeroValue() {
        guard let result = Duration.nanoseconds(0).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToYearsFromNanosecondsPrecisionLoss() {
        guard let result = Duration.nanoseconds(63113903999999999).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToYearsFromMicroseconds() {
        guard let result = Duration.microseconds(63113904000000).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToYearsFromMicrosecondsZeroValue() {
        guard let result = Duration.microseconds(0).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToYearsFromMicrosecondsPrecisionLoss() {
        guard let result = Duration.microseconds(63113903999999).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToYearsFromMilliseconds() {
        guard let result = Duration.milliseconds(63113904000).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToYearsFromMillisecondsZeroValue() {
        guard let result = Duration.milliseconds(0).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToYearsFromMillisecondsPrecisionLoss() {
        guard let result = Duration.milliseconds(63113903999).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToYearsFromSeconds() {
        guard let result = Duration.seconds(63113904).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToYearsFromSecondsZeroValue() {
        guard let result = Duration.seconds(0).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToYearsFromSecondsPrecisionLoss() {
        guard let result = Duration.seconds(63113903).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToYearsFromMinutesLast() {
        guard let result = Duration.minutes(1051898).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToYearsFromMinutesFirst() {
        guard let result = Duration.minutes(1051899).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToYearsFromMinutesZeroValue() {
        guard let result = Duration.minutes(0).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToYearsFromMinutesPrecisionLoss() {
        guard let result = Duration.minutes(1051897).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToYearsFromHoursLast() {
        guard let result = Duration.hours(17531).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToYearsFromHoursFirst() {
        guard let result = Duration.hours(17532).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToYearsFromHoursZeroValue() {
        guard let result = Duration.hours(0).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToYearsFromHoursPrecisionLoss() {
        guard let result = Duration.hours(17529).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToYearsFromDaysLast() {
        guard let result = Duration.days(730).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToYearsFromDaysFirst() {
        guard let result = Duration.days(731).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToYearsFromDaysZeroValue() {
        guard let result = Duration.days(0).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToYearsFromDaysPrecisionLoss() {
        guard let result = Duration.days(729).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToYearsFromWeeksLast() {
        guard let result = Duration.weeks(104).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToYearsFromWeeksFirst() {
        guard let result = Duration.weeks(105).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToYearsFromWeeksZeroValue() {
        guard let result = Duration.weeks(0).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToYearsFromWeeksPrecisionLoss() {
        guard let result = Duration.weeks(103).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToYearsFromMonths() {
        guard let result = Duration.months(24).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToYearsFromMonthsZeroValue() {
        guard let result = Duration.months(0).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

    ///
    func testCastToYearsFromMonthsPrecisionLoss() {
        guard let result = Duration.months(23).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 1)
    }

    ///
    func testCastToYearsFromYears() {
        guard let result = Duration.years(2).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 2)
    }

    ///
    func testCastToYearsFromYearsZeroValue() {
        guard let result = Duration.years(0).years else {
            XCTFail("Value is nil.")
            return
        }

        guard case .years = result else {
            XCTFail("Value with the bad case.")
            return
        }

        XCTAssertEqual(result.count, 0)
    }

}
