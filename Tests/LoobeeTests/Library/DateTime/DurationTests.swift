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
        let duration = Duration.nanoseconds(2).nanoseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToNanosecondsFromNanosecondsZeroValue() {
        let duration = Duration.nanoseconds(0).nanoseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToNanosecondsFromMicroseconds() {
        let duration = Duration.microseconds(2).nanoseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1)
        XCTAssertEqual(duration?.count, 2000)
    }

    ///
    func testCastToNanosecondsFromMicrosecondsZeroValue() {
        let duration = Duration.microseconds(0).nanoseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToNanosecondsFromMicrosecondsOverflow() {
        XCTAssertNil(Duration.microseconds(Int64.max).nanoseconds)
    }

    ///
    func testCastToNanosecondsFromMilliseconds() {
        let duration = Duration.milliseconds(2).nanoseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1)
        XCTAssertEqual(duration?.count, 2000000)
    }

    ///
    func testCastToNanosecondsFromMillisecondsZeroValue() {
        let duration = Duration.milliseconds(0).nanoseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToNanosecondsFromMillisecondsOverflow() {
        XCTAssertNil(Duration.milliseconds(Int64.max).nanoseconds)
    }

    ///
    func testCastToNanosecondsFromSeconds() {
        let duration = Duration.seconds(2).nanoseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1)
        XCTAssertEqual(duration?.count, 2000000000)
    }

    ///
    func testCastToNanosecondsFromSecondsZeroValue() {
        let duration = Duration.seconds(0).nanoseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToNanosecondsFromSecondsOverflow() {
        XCTAssertNil(Duration.seconds(Int64.max).nanoseconds)
    }

    ///
    func testCastToNanosecondsFromMinutes() {
        let duration = Duration.minutes(2).nanoseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1)
        XCTAssertEqual(duration?.count, 120000000000)
    }

    ///
    func testCastToNanosecondsFromMinutesZeroValue() {
        let duration = Duration.minutes(0).nanoseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToNanosecondsFromMinutesOverflow() {
        XCTAssertNil(Duration.minutes(Int64.max).nanoseconds)
    }

    ///
    func testCastToNanosecondsFromHours() {
        let duration = Duration.hours(2).nanoseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1)
        XCTAssertEqual(duration?.count, 7200000000000)
    }

    ///
    func testCastToNanosecondsFromHoursZeroValue() {
        let duration = Duration.hours(0).nanoseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToNanosecondsFromHoursOverflow() {
        XCTAssertNil(Duration.hours(Int64.max).nanoseconds)
    }

    ///
    func testCastToNanosecondsFromDays() {
        let duration = Duration.days(2).nanoseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1)
        XCTAssertEqual(duration?.count, 172800000000000)
    }

    ///
    func testCastToNanosecondsFromDaysZeroValue() {
        let duration = Duration.days(0).nanoseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToNanosecondsFromDaysOverflow() {
        XCTAssertNil(Duration.days(Int64.max).nanoseconds)
    }

    ///
    func testCastToNanosecondsFromWeeks() {
        let duration = Duration.weeks(2).nanoseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1)
        XCTAssertEqual(duration?.count, 1209600000000000)
    }

    ///
    func testCastToNanosecondsFromWeeksZeroValue() {
        let duration = Duration.weeks(0).nanoseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToNanosecondsFromWeeksOverflow() {
        XCTAssertNil(Duration.weeks(Int64.max).nanoseconds)
    }

    ///
    func testCastToNanosecondsFromMonths() {
        let duration = Duration.months(2).nanoseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1)
        XCTAssertEqual(duration?.count, 5259492000000000)
    }

    ///
    func testCastToNanosecondsFromMonthsZeroValue() {
        let duration = Duration.months(0).nanoseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToNanosecondsFromMonthsOverflow() {
        XCTAssertNil(Duration.months(Int64.max).nanoseconds)
    }

    ///
    func testCastToNanosecondsFromYears() {
        let duration = Duration.years(2).nanoseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1)
        XCTAssertEqual(duration?.count, 63113904000000000)
    }

    ///
    func testCastToNanosecondsFromYearsZeroValue() {
        let duration = Duration.years(0).nanoseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToNanosecondsFromYearsOverflow() {
        XCTAssertNil(Duration.years(Int64.max).nanoseconds)
    }

    ///
    func testCastToMicrosecondsFromNanoseconds() {
        let duration = Duration.nanoseconds(2000).microseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToMicrosecondsFromNanosecondsZeroValue() {
        let duration = Duration.nanoseconds(0).microseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMicrosecondsFromNanosecondsPrecisionLoss() {
        let duration = Duration.nanoseconds(1999).microseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToMicrosecondsFromMicroseconds() {
        let duration = Duration.microseconds(2).microseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToMicrosecondsFromMicrosecondsZeroValue() {
        let duration = Duration.microseconds(0).microseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMicrosecondsFromMilliseconds() {
        let duration = Duration.milliseconds(2).microseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000)
        XCTAssertEqual(duration?.count, 2000)
    }

    ///
    func testCastToMicrosecondsFromMillisecondsZeroValue() {
        let duration = Duration.milliseconds(0).microseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMicrosecondsFromMillisecondsOverflow() {
        XCTAssertNil(Duration.milliseconds(Int64.max).microseconds)
    }

    ///
    func testCastToMicrosecondsFromSeconds() {
        let duration = Duration.seconds(2).microseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000)
        XCTAssertEqual(duration?.count, 2000000)
    }

    ///
    func testCastToMicrosecondsFromSecondsZeroValue() {
        let duration = Duration.seconds(0).microseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMicrosecondsFromSecondsOverflow() {
        XCTAssertNil(Duration.seconds(Int64.max).microseconds)
    }

    ///
    func testCastToMicrosecondsFromMinutes() {
        let duration = Duration.minutes(2).microseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000)
        XCTAssertEqual(duration?.count, 120000000)
    }

    ///
    func testCastToMicrosecondsFromMinutesZeroValue() {
        let duration = Duration.minutes(0).microseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMicrosecondsFromMinutesOverflow() {
        XCTAssertNil(Duration.minutes(Int64.max).microseconds)
    }

    ///
    func testCastToMicrosecondsFromHours() {
        let duration = Duration.hours(2).microseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000)
        XCTAssertEqual(duration?.count, 7200000000)
    }

    ///
    func testCastToMicrosecondsFromHoursZeroValue() {
        let duration = Duration.hours(0).microseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMicrosecondsFromHoursOverflow() {
        XCTAssertNil(Duration.hours(Int64.max).microseconds)
    }

    ///
    func testCastToMicrosecondsFromDays() {
        let duration = Duration.days(2).microseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000)
        XCTAssertEqual(duration?.count, 172800000000)
    }

    ///
    func testCastToMicrosecondsFromDaysZeroValue() {
        let duration = Duration.days(0).microseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMicrosecondsFromDaysOverflow() {
        XCTAssertNil(Duration.days(Int64.max).microseconds)
    }

    ///
    func testCastToMicrosecondsFromWeeks() {
        let duration = Duration.weeks(2).microseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000)
        XCTAssertEqual(duration?.count, 1209600000000)
    }

    ///
    func testCastToMicrosecondsFromWeeksZeroValue() {
        let duration = Duration.weeks(0).microseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMicrosecondsFromWeeksOverflow() {
        XCTAssertNil(Duration.weeks(Int64.max).microseconds)
    }

    ///
    func testCastToMicrosecondsFromMonths() {
        let duration = Duration.months(2).microseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000)
        XCTAssertEqual(duration?.count, 5259492000000)
    }

    ///
    func testCastToMicrosecondsFromMonthsZeroValue() {
        let duration = Duration.months(0).microseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMicrosecondsFromMonthsOverflow() {
        XCTAssertNil(Duration.months(Int64.max).microseconds)
    }

    ///
    func testCastToMicrosecondsFromYears() {
        let duration = Duration.years(2).microseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000)
        XCTAssertEqual(duration?.count, 63113904000000)
    }

    ///
    func testCastToMicrosecondsFromYearsZeroValue() {
        let duration = Duration.years(0).microseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMicrosecondsFromYearsOverflow() {
        XCTAssertNil(Duration.years(Int64.max).microseconds)
    }

    ///
    func testCastToMillisecondsFromNanoseconds() {
        let duration = Duration.nanoseconds(2000000).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToMillisecondsFromNanosecondsZeroValue() {
        let duration = Duration.nanoseconds(0).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMillisecondsFromNanosecondsPrecisionLoss() {
        let duration = Duration.nanoseconds(1999999).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToMillisecondsFromMicroseconds() {
        let duration = Duration.microseconds(2000).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToMillisecondsFromMicrosecondsZeroValue() {
        let duration = Duration.microseconds(0).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMillisecondsFromMicrosecondsPrecisionLoss() {
        let duration = Duration.microseconds(1999).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToMillisecondsFromMilliseconds() {
        let duration = Duration.milliseconds(2).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToMillisecondsFromMillisecondsZeroValue() {
        let duration = Duration.milliseconds(0).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMillisecondsFromSeconds() {
        let duration = Duration.seconds(2).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000)
        XCTAssertEqual(duration?.count, 2000)
    }

    ///
    func testCastToMillisecondsFromSecondsZeroValue() {
        let duration = Duration.seconds(0).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMillisecondsFromSecondsOverflow() {
        XCTAssertNil(Duration.seconds(Int64.max).milliseconds)
    }

    ///
    func testCastToMillisecondsFromMinutes() {
        let duration = Duration.minutes(2).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000)
        XCTAssertEqual(duration?.count, 120000)
    }

    ///
    func testCastToMillisecondsFromMinutesZeroValue() {
        let duration = Duration.minutes(0).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMillisecondsFromMinutesOverflow() {
        XCTAssertNil(Duration.minutes(Int64.max).milliseconds)
    }

    ///
    func testCastToMillisecondsFromHours() {
        let duration = Duration.hours(2).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000)
        XCTAssertEqual(duration?.count, 7200000)
    }

    ///
    func testCastToMillisecondsFromHoursZeroValue() {
        let duration = Duration.hours(0).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMillisecondsFromHoursOverflow() {
        XCTAssertNil(Duration.hours(Int64.max).milliseconds)
    }

    ///
    func testCastToMillisecondsFromDays() {
        let duration = Duration.days(2).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000)
        XCTAssertEqual(duration?.count, 172800000)
    }

    ///
    func testCastToMillisecondsFromDaysZeroValue() {
        let duration = Duration.days(0).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMillisecondsFromDaysOverflow() {
        XCTAssertNil(Duration.days(Int64.max).milliseconds)
    }

    ///
    func testCastToMillisecondsFromWeeks() {
        let duration = Duration.weeks(2).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000)
        XCTAssertEqual(duration?.count, 1209600000)
    }

    ///
    func testCastToMillisecondsFromWeeksZeroValue() {
        let duration = Duration.weeks(0).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMillisecondsFromWeeksOverflow() {
        XCTAssertNil(Duration.weeks(Int64.max).milliseconds)
    }

    ///
    func testCastToMillisecondsFromMonths() {
        let duration = Duration.months(2).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000)
        XCTAssertEqual(duration?.count, 5259492000)
    }

    ///
    func testCastToMillisecondsFromMonthsZeroValue() {
        let duration = Duration.months(0).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMillisecondsFromMonthsOverflow() {
        XCTAssertNil(Duration.months(Int64.max).milliseconds)
    }

    ///
    func testCastToMillisecondsFromYears() {
        let duration = Duration.years(2).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000)
        XCTAssertEqual(duration?.count, 63113904000)
    }

    ///
    func testCastToMillisecondsFromYearsZeroValue() {
        let duration = Duration.years(0).milliseconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMillisecondsFromYearsOverflow() {
        XCTAssertNil(Duration.years(Int64.max).milliseconds)
    }

    ///
    func testCastToSecondsFromNanoseconds() {
        let duration = Duration.nanoseconds(2000000000).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToSecondsFromNanosecondsZeroValue() {
        let duration = Duration.nanoseconds(0).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToSecondsFromNanosecondsPrecisionLoss() {
        let duration = Duration.nanoseconds(1999999999).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToSecondsFromMicroseconds() {
        let duration = Duration.microseconds(2000000).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToSecondsFromMicrosecondsZeroValue() {
        let duration = Duration.microseconds(0).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToSecondsFromMicrosecondsPrecisionLoss() {
        let duration = Duration.microseconds(1999999).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToSecondsFromMilliseconds() {
        let duration = Duration.milliseconds(2000).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToSecondsFromMillisecondsZeroValue() {
        let duration = Duration.milliseconds(0).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToSecondsFromMillisecondsPrecisionLoss() {
        let duration = Duration.milliseconds(1999).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToSecondsFromSeconds() {
        let duration = Duration.seconds(2).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToSecondsFromSecondsZeroValue() {
        let duration = Duration.seconds(0).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToSecondsFromMinutes() {
        let duration = Duration.minutes(2).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000000)
        XCTAssertEqual(duration?.count, 120)
    }

    ///
    func testCastToSecondsFromMinutesZeroValue() {
        let duration = Duration.minutes(0).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToSecondsFromMinutesOverflow() {
        XCTAssertNil(Duration.minutes(Int64.max).seconds)
    }

    ///
    func testCastToSecondsFromHours() {
        let duration = Duration.hours(2).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000000)
        XCTAssertEqual(duration?.count, 7200)
    }

    ///
    func testCastToSecondsFromHoursZeroValue() {
        let duration = Duration.hours(0).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToSecondsFromHoursOverflow() {
        XCTAssertNil(Duration.hours(Int64.max).seconds)
    }

    ///
    func testCastToSecondsFromDays() {
        let duration = Duration.days(2).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000000)
        XCTAssertEqual(duration?.count, 172800)
    }

    ///
    func testCastToSecondsFromDaysZeroValue() {
        let duration = Duration.days(0).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToSecondsFromDaysOverflow() {
        XCTAssertNil(Duration.days(Int64.max).seconds)
    }

    ///
    func testCastToSecondsFromWeeks() {
        let duration = Duration.weeks(2).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000000)
        XCTAssertEqual(duration?.count, 1209600)
    }

    ///
    func testCastToSecondsFromWeeksZeroValue() {
        let duration = Duration.weeks(0).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToSecondsFromWeeksOverflow() {
        XCTAssertNil(Duration.weeks(Int64.max).seconds)
    }

    ///
    func testCastToSecondsFromMonths() {
        let duration = Duration.months(2).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000000)
        XCTAssertEqual(duration?.count, 5259492)
    }

    ///
    func testCastToSecondsFromMonthsZeroValue() {
        let duration = Duration.months(0).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToSecondsFromMonthsOverflow() {
        XCTAssertNil(Duration.months(Int64.max).seconds)
    }

    ///
    func testCastToSecondsFromYears() {
        let duration = Duration.years(2).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000000)
        XCTAssertEqual(duration?.count, 63113904)
    }

    ///
    func testCastToSecondsFromYearsZeroValue() {
        let duration = Duration.years(0).seconds

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 1000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToSecondsFromYearsOverflow() {
        XCTAssertNil(Duration.years(Int64.max).seconds)
    }

    ///
    func testCastToMinutesFromNanoseconds() {
        let duration = Duration.nanoseconds(120000000000).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 60000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToMinutesFromNanosecondsZeroValue() {
        let duration = Duration.nanoseconds(0).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 60000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMinutesFromNanosecondsPrecisionLoss() {
        let duration = Duration.nanoseconds(119999999999).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 60000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToMinutesFromMicroseconds() {
        let duration = Duration.microseconds(120000000).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 60000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToMinutesFromMicrosecondsZeroValue() {
        let duration = Duration.microseconds(0).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 60000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMinutesFromMicrosecondsPrecisionLoss() {
        let duration = Duration.microseconds(119999999).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 60000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToMinutesFromMilliseconds() {
        let duration = Duration.milliseconds(120000).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 60000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToMinutesFromMillisecondsZeroValue() {
        let duration = Duration.milliseconds(0).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 60000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMinutesFromMillisecondsPrecisionLoss() {
        let duration = Duration.milliseconds(119999).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 60000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToMinutesFromSeconds() {
        let duration = Duration.seconds(120).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 60000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToMinutesFromSecondsZeroValue() {
        let duration = Duration.seconds(0).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 60000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMinutesFromSecondsPrecisionLoss() {
        let duration = Duration.seconds(119).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 60000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToMinutesFromMinutes() {
        let duration = Duration.minutes(2).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 60000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToMinutesFromMinutesZeroValue() {
        let duration = Duration.minutes(0).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 60000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMinutesFromHours() {
        let duration = Duration.hours(2).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 60000000000)
        XCTAssertEqual(duration?.count, 120)
    }

    ///
    func testCastToMinutesFromHoursZeroValue() {
        let duration = Duration.hours(0).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 60000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMinutesFromHoursOverflow() {
        XCTAssertNil(Duration.hours(Int64.max).minutes)
    }

    ///
    func testCastToMinutesFromDays() {
        let duration = Duration.days(2).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 60000000000)
        XCTAssertEqual(duration?.count, 2880)
    }

    ///
    func testCastToMinutesFromDaysZeroValue() {
        let duration = Duration.days(0).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 60000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMinutesFromDaysOverflow() {
        XCTAssertNil(Duration.days(Int64.max).minutes)
    }

    ///
    func testCastToMinutesFromWeeks() {
        let duration = Duration.weeks(2).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 60000000000)
        XCTAssertEqual(duration?.count, 20160)
    }

    ///
    func testCastToMinutesFromWeeksZeroValue() {
        let duration = Duration.weeks(0).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 60000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMinutesFromWeeksOverflow() {
        XCTAssertNil(Duration.weeks(Int64.max).minutes)
    }

    ///
    func testCastToMinutesFromMonths() {
        let duration = Duration.months(2).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 60000000000)
        XCTAssertEqual(duration?.count, 87658)
    }

    ///
    func testCastToMinutesFromMonthsZeroValue() {
        let duration = Duration.months(0).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 60000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMinutesFromMonthsOverflow() {
        XCTAssertNil(Duration.months(Int64.max).minutes)
    }

    ///
    func testCastToMinutesFromYears() {
        let duration = Duration.years(2).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 60000000000)
        XCTAssertEqual(duration?.count, 1051898)
    }

    ///
    func testCastToMinutesFromYearsZeroValue() {
        let duration = Duration.years(0).minutes

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 60000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMinutesFromYearsOverflow() {
        XCTAssertNil(Duration.years(Int64.max).minutes)
    }

    ///
    func testCastToHoursFromNanoseconds() {
        let duration = Duration.nanoseconds(7200000000000).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 3600000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToHoursFromNanosecondsZeroValue() {
        let duration = Duration.nanoseconds(0).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 3600000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToHoursFromNanosecondsPrecisionLoss() {
        let duration = Duration.nanoseconds(7199999999999).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 3600000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToHoursFromMicroseconds() {
        let duration = Duration.microseconds(7200000000).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 3600000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToHoursFromMicrosecondsZeroValue() {
        let duration = Duration.microseconds(0).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 3600000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToHoursFromMicrosecondsPrecisionLoss() {
        let duration = Duration.microseconds(7199999999).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 3600000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToHoursFromMilliseconds() {
        let duration = Duration.milliseconds(7200000).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 3600000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToHoursFromMillisecondsZeroValue() {
        let duration = Duration.milliseconds(0).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 3600000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToHoursFromMillisecondsPrecisionLoss() {
        let duration = Duration.milliseconds(7199999).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 3600000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToHoursFromSeconds() {
        let duration = Duration.seconds(7200).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 3600000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToHoursFromSecondsZeroValue() {
        let duration = Duration.seconds(0).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 3600000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToHoursFromSecondsPrecisionLoss() {
        let duration = Duration.seconds(7199).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 3600000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToHoursFromMinutes() {
        let duration = Duration.minutes(120).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 3600000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToHoursFromMinutesZeroValue() {
        let duration = Duration.minutes(0).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 3600000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToHoursFromMinutesPrecisionLoss() {
        let duration = Duration.minutes(119).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 3600000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToHoursFromHours() {
        let duration = Duration.hours(2).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 3600000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToHoursFromHoursZeroValue() {
        let duration = Duration.hours(0).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 3600000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToHoursFromDays() {
        let duration = Duration.days(2).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 3600000000000)
        XCTAssertEqual(duration?.count, 48)
    }

    ///
    func testCastToHoursFromDaysZeroValue() {
        let duration = Duration.days(0).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 3600000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToHoursFromDaysOverflow() {
        XCTAssertNil(Duration.days(Int64.max).hours)
    }

    ///
    func testCastToHoursFromWeeks() {
        let duration = Duration.weeks(2).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 3600000000000)
        XCTAssertEqual(duration?.count, 336)
    }

    ///
    func testCastToHoursFromWeeksZeroValue() {
        let duration = Duration.weeks(0).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 3600000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToHoursFromWeeksOverflow() {
        XCTAssertNil(Duration.weeks(Int64.max).hours)
    }

    ///
    func testCastToHoursFromMonths() {
        let duration = Duration.months(2).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 3600000000000)
        XCTAssertEqual(duration?.count, 1460)
    }

    ///
    func testCastToHoursFromMonthsZeroValue() {
        let duration = Duration.months(0).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 3600000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToHoursFromMonthsOverflow() {
        XCTAssertNil(Duration.months(Int64.max).hours)
    }

    ///
    func testCastToHoursFromYears() {
        let duration = Duration.years(2).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 3600000000000)
        XCTAssertEqual(duration?.count, 17531)
    }

    ///
    func testCastToHoursFromYearsZeroValue() {
        let duration = Duration.years(0).hours

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 3600000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToHoursFromYearsOverflow() {
        XCTAssertNil(Duration.years(Int64.max).hours)
    }

    ///
    func testCastToDaysFromNanoseconds() {
        let duration = Duration.nanoseconds(172800000000000).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToDaysFromNanosecondsZeroValue() {
        let duration = Duration.nanoseconds(0).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToDaysFromNanosecondsPrecisionLoss() {
        let duration = Duration.nanoseconds(172799999999999).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToDaysFromMicroseconds() {
        let duration = Duration.microseconds(172800000000).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToDaysFromMicrosecondsZeroValue() {
        let duration = Duration.microseconds(0).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToDaysFromMicrosecondsPrecisionLoss() {
        let duration = Duration.microseconds(172799999999).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToDaysFromMilliseconds() {
        let duration = Duration.milliseconds(172800000).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToDaysFromMillisecondsZeroValue() {
        let duration = Duration.milliseconds(0).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToDaysFromMillisecondsPrecisionLoss() {
        let duration = Duration.milliseconds(172799999).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToDaysFromSeconds() {
        let duration = Duration.seconds(172800).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToDaysFromSecondsZeroValue() {
        let duration = Duration.seconds(0).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToDaysFromSecondsPrecisionLoss() {
        let duration = Duration.seconds(172799).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToDaysFromMinutes() {
        let duration = Duration.minutes(2880).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToDaysFromMinutesZeroValue() {
        let duration = Duration.minutes(0).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToDaysFromMinutesPrecisionLoss() {
        let duration = Duration.minutes(2879).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToDaysFromHours() {
        let duration = Duration.hours(48).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToDaysFromHoursZeroValue() {
        let duration = Duration.hours(0).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToDaysFromHoursPrecisionLoss() {
        let duration = Duration.hours(47).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToDaysFromDays() {
        let duration = Duration.days(2).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToDaysFromDaysZeroValue() {
        let duration = Duration.days(0).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToDaysFromWeeks() {
        let duration = Duration.weeks(2).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 14)
    }

    ///
    func testCastToDaysFromWeeksZeroValue() {
        let duration = Duration.weeks(0).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToDaysFromWeeksOverflow() {
        XCTAssertNil(Duration.weeks(Int64.max).days)
    }

    ///
    func testCastToDaysFromMonths() {
        let duration = Duration.months(2).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 60)
    }

    ///
    func testCastToDaysFromMonthsZeroValue() {
        let duration = Duration.months(0).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToDaysFromMonthsOverflow() {
        XCTAssertNil(Duration.months(Int64.max).days)
    }

    ///
    func testCastToDaysFromYears() {
        let duration = Duration.years(2).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 730)
    }

    ///
    func testCastToDaysFromYearsZeroValue() {
        let duration = Duration.years(0).days

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 86400000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToDaysFromYearsOverflow() {
        XCTAssertNil(Duration.years(Int64.max).days)
    }

    ///
    func testCastToWeeksFromNanoseconds() {
        let duration = Duration.nanoseconds(1209600000000000).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToWeeksFromNanosecondsZeroValue() {
        let duration = Duration.nanoseconds(0).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToWeeksFromNanosecondsPrecisionLoss() {
        let duration = Duration.nanoseconds(1209599999999999).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToWeeksFromMicroseconds() {
        let duration = Duration.microseconds(1209600000000).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToWeeksFromMicrosecondsZeroValue() {
        let duration = Duration.microseconds(0).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToWeeksFromMicrosecondsPrecisionLoss() {
        let duration = Duration.microseconds(1209599999999).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToWeeksFromMilliseconds() {
        let duration = Duration.milliseconds(1209600000).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToWeeksFromMillisecondsZeroValue() {
        let duration = Duration.milliseconds(0).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToWeeksFromMillisecondsPrecisionLoss() {
        let duration = Duration.milliseconds(1209599999).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToWeeksFromSeconds() {
        let duration = Duration.seconds(1209600).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToWeeksFromSecondsZeroValue() {
        let duration = Duration.seconds(0).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToWeeksFromSecondsPrecisionLoss() {
        let duration = Duration.seconds(1209599).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToWeeksFromMinutes() {
        let duration = Duration.minutes(20160).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToWeeksFromMinutesZeroValue() {
        let duration = Duration.minutes(0).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToWeeksFromMinutesPrecisionLoss() {
        let duration = Duration.minutes(20159).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToWeeksFromHours() {
        let duration = Duration.hours(336).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToWeeksFromHoursZeroValue() {
        let duration = Duration.hours(0).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToWeeksFromHoursPrecisionLoss() {
        let duration = Duration.hours(335).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToWeeksFromDays() {
        let duration = Duration.days(14).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToWeeksFromDaysZeroValue() {
        let duration = Duration.days(0).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToWeeksFromDaysPrecisionLoss() {
        let duration = Duration.days(13).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToWeeksFromWeeks() {
        let duration = Duration.weeks(2).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToWeeksFromWeeksZeroValue() {
        let duration = Duration.weeks(0).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToWeeksFromMonths() {
        let duration = Duration.months(2).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 8)
    }

    ///
    func testCastToWeeksFromMonthsZeroValue() {
        let duration = Duration.months(0).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToWeeksFromMonthsOverflow() {
        XCTAssertNil(Duration.months(Int64.max).weeks)
    }

    ///
    func testCastToWeeksFromYears() {
        let duration = Duration.years(2).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 104)
    }

    ///
    func testCastToWeeksFromYearsZeroValue() {
        let duration = Duration.years(0).weeks

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 604800000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToWeeksFromYearsOverflow() {
        XCTAssertNil(Duration.years(Int64.max).weeks)
    }

    ///
    func testCastToMonthsFromNanoseconds() {
        let duration = Duration.nanoseconds(5259492000000000).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToMonthsFromNanosecondsZeroValue() {
        let duration = Duration.nanoseconds(0).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMonthsFromNanosecondsPrecisionLoss() {
        let duration = Duration.nanoseconds(5259491999999999).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToMonthsFromMicroseconds() {
        let duration = Duration.microseconds(5259492000000).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToMonthsFromMicrosecondsZeroValue() {
        let duration = Duration.microseconds(0).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMonthsFromMicrosecondsPrecisionLoss() {
        let duration = Duration.microseconds(5259491999999).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToMonthsFromMilliseconds() {
        let duration = Duration.milliseconds(5259492000).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToMonthsFromMillisecondsZeroValue() {
        let duration = Duration.milliseconds(0).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMonthsFromMillisecondsPrecisionLoss() {
        let duration = Duration.milliseconds(5259491999).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToMonthsFromSeconds() {
        let duration = Duration.seconds(5259492).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToMonthsFromSecondsZeroValue() {
        let duration = Duration.seconds(0).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMonthsFromSecondsPrecisionLoss() {
        let duration = Duration.seconds(5259491).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToMonthsFromMinutesLast() {
        let duration = Duration.minutes(87658).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToMonthsFromMinutesFirst() {
        let duration = Duration.minutes(87659).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToMonthsFromMinutesZeroValue() {
        let duration = Duration.minutes(0).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMonthsFromMinutesPrecisionLoss() {
        let duration = Duration.minutes(87657).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToMonthsFromHoursLast() {
        let duration = Duration.hours(1460).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToMonthsFromHoursFirst() {
        let duration = Duration.hours(1461).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToMonthsFromHoursZeroValue() {
        let duration = Duration.hours(0).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMonthsFromHoursPrecisionLoss() {
        let duration = Duration.hours(1459).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToMonthsFromDaysLast() {
        let duration = Duration.days(60).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToMonthsFromDaysFirst() {
        let duration = Duration.days(61).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToMonthsFromDaysZeroValue() {
        let duration = Duration.days(0).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMonthsFromDaysPrecisionLoss() {
        let duration = Duration.days(59).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToMonthsFromWeeksLast() {
        let duration = Duration.weeks(8).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToMonthsFromWeeksFirst() {
        let duration = Duration.weeks(9).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToMonthsFromWeeksZeroValue() {
        let duration = Duration.weeks(0).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMonthsFromWeeksPrecisionLoss() {
        let duration = Duration.weeks(7).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToMonthsFromMonths() {
        let duration = Duration.months(2).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToMonthsFromMonthsZeroValue() {
        let duration = Duration.months(0).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMonthsFromYears() {
        let duration = Duration.years(2).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 24)
    }

    ///
    func testCastToMonthsFromYearsZeroValue() {
        let duration = Duration.years(0).months

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 2629746000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToMonthsFromYearsOverflow() {
        XCTAssertNil(Duration.years(Int64.max).months)
    }

    ///
    func testCastToYearsFromNanoseconds() {
        let duration = Duration.nanoseconds(63113904000000000).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToYearsFromNanosecondsZeroValue() {
        let duration = Duration.nanoseconds(0).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToYearsFromNanosecondsPrecisionLoss() {
        let duration = Duration.nanoseconds(63113903999999999).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToYearsFromMicroseconds() {
        let duration = Duration.microseconds(63113904000000).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToYearsFromMicrosecondsZeroValue() {
        let duration = Duration.microseconds(0).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToYearsFromMicrosecondsPrecisionLoss() {
        let duration = Duration.microseconds(63113903999999).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToYearsFromMilliseconds() {
        let duration = Duration.milliseconds(63113904000).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToYearsFromMillisecondsZeroValue() {
        let duration = Duration.milliseconds(0).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToYearsFromMillisecondsPrecisionLoss() {
        let duration = Duration.milliseconds(63113903999).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToYearsFromSeconds() {
        let duration = Duration.seconds(63113904).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToYearsFromSecondsZeroValue() {
        let duration = Duration.seconds(0).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToYearsFromSecondsPrecisionLoss() {
        let duration = Duration.seconds(63113903).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToYearsFromMinutesLast() {
        let duration = Duration.minutes(1051898).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToYearsFromMinutesFirst() {
        let duration = Duration.minutes(1051899).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToYearsFromMinutesZeroValue() {
        let duration = Duration.minutes(0).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToYearsFromMinutesPrecisionLoss() {
        let duration = Duration.minutes(1051897).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToYearsFromHoursLast() {
        let duration = Duration.hours(17531).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToYearsFromHoursFirst() {
        let duration = Duration.hours(17532).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToYearsFromHoursZeroValue() {
        let duration = Duration.hours(0).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToYearsFromHoursPrecisionLoss() {
        let duration = Duration.hours(17529).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToYearsFromDaysLast() {
        let duration = Duration.days(730).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToYearsFromDaysFirst() {
        let duration = Duration.days(731).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToYearsFromDaysZeroValue() {
        let duration = Duration.days(0).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToYearsFromDaysPrecisionLoss() {
        let duration = Duration.days(729).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToYearsFromWeeksLast() {
        let duration = Duration.weeks(104).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToYearsFromWeeksFirst() {
        let duration = Duration.weeks(105).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToYearsFromWeeksZeroValue() {
        let duration = Duration.weeks(0).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToYearsFromWeeksPrecisionLoss() {
        let duration = Duration.weeks(103).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToYearsFromMonths() {
        let duration = Duration.months(24).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToYearsFromMonthsZeroValue() {
        let duration = Duration.months(0).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 0)
    }

    ///
    func testCastToYearsFromMonthsPrecisionLoss() {
        let duration = Duration.months(23).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 1)
    }

    ///
    func testCastToYearsFromYears() {
        let duration = Duration.years(2).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 2)
    }

    ///
    func testCastToYearsFromYearsZeroValue() {
        let duration = Duration.years(0).years

        XCTAssertNotNil(duration)
        XCTAssertEqual(duration?.ratio, 31556952000000000)
        XCTAssertEqual(duration?.count, 0)
    }

}
