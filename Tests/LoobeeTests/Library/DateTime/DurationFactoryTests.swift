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

internal final class DurationFactoryTests: XCTestCase {
    ///
    func testIntegerLiteral() {
        let duration: Duration = 123

        XCTAssertEqual(duration.count, 123)
        XCTAssertEqual(duration.unit, .uniform)
    }

    ///
    func testDefaultInit() {
        let duration = Duration()

        XCTAssertEqual(duration.count, 0)
        XCTAssertEqual(duration.unit, .uniform)
    }

    ///
    func testMax() {
        let duration = Duration.max

        XCTAssertEqual(duration.count, Int64.max)
        XCTAssertEqual(duration.unit, .uniform)
    }

    ///
    func testMin() {
        let duration = Duration.min

        XCTAssertEqual(duration.count, Int64.min)
        XCTAssertEqual(duration.unit, .uniform)
    }

    ///
    func testNanoseconds() {
        let duration: Duration = .nanoseconds(123)

        XCTAssertEqual(duration.count, 123)
        XCTAssertEqual(duration.unit, .nanoseconds)
    }

    ///
    func testMicroseconds() {
        let duration: Duration = .microseconds(123)

        XCTAssertEqual(duration.count, 123)
        XCTAssertEqual(duration.unit, .microseconds)
    }

    ///
    func testMilliseconds() {
        let duration: Duration = .milliseconds(123)

        XCTAssertEqual(duration.count, 123)
        XCTAssertEqual(duration.unit, .milliseconds)
    }

    ///
    func testSeconds() {
        let duration: Duration = .seconds(123)

        XCTAssertEqual(duration.count, 123)
        XCTAssertEqual(duration.unit, .seconds)
    }

    ///
    func testMinutes() {
        let duration: Duration = .minutes(123)

        XCTAssertEqual(duration.count, 123)
        XCTAssertEqual(duration.unit, .minutes)
    }

    ///
    func testHours() {
        let duration: Duration = .hours(123)

        XCTAssertEqual(duration.count, 123)
        XCTAssertEqual(duration.unit, .hours)
    }

    ///
    func testDays() {
        let duration: Duration = .days(123)

        XCTAssertEqual(duration.count, 123)
        XCTAssertEqual(duration.unit, .days)
    }

    ///
    func testWeeks() {
        let duration: Duration = .weeks(123)

        XCTAssertEqual(duration.count, 123)
        XCTAssertEqual(duration.unit, .weeks)
    }

    ///
    func testMonths() {
        let duration: Duration = .months(123)

        XCTAssertEqual(duration.count, 123)
        XCTAssertEqual(duration.unit, .months)
    }

    ///
    func testYears() {
        let duration: Duration = .years(123)

        XCTAssertEqual(duration.count, 123)
        XCTAssertEqual(duration.unit, .years)
    }
}
