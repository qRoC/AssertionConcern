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

internal final class DurationDivisionByTests: XCTestCase {
    ///
    func testDivisionBy60000000000() {
        XCTAssertEqual(divisionBy60000000000(60000000000), 1)
    }

    ///
    func testDivisionBy3600000000() {
        XCTAssertEqual(divisionBy3600000000(3600000000), 1)
    }

    ///
    func testDivisionBy3600000000000() {
        XCTAssertEqual(divisionBy3600000000000(3600000000000), 1)
    }

    ///
    func testDivisionBy86400000000() {
        XCTAssertEqual(divisionBy86400000000(86400000000), 1)
    }

    ///
    func testDivisionBy86400000000000() {
        XCTAssertEqual(divisionBy86400000000000(86400000000000), 1)
    }

    ///
    func testDivisionBy604800000000() {
        XCTAssertEqual(divisionBy604800000000(604800000000), 1)
    }

    ///
    func testDivisionBy604800000000000() {
        XCTAssertEqual(divisionBy604800000000000(604800000000000), 1)
    }

    ///
    func testDivisionBy2629746000() {
        XCTAssertEqual(divisionBy2629746000(2629746000), 1)
    }

    ///
    func testDivisionBy2629746000000() {
        XCTAssertEqual(divisionBy2629746000000(2629746000000), 1)
    }

    ///
    func testDivisionBy2629746000000000() {
        XCTAssertEqual(divisionBy2629746000000000(2629746000000000), 1)
    }

    ///
    func testDivisionBy31556952000() {
        XCTAssertEqual(divisionBy31556952000(31556952000), 1)
    }

    ///
    func testDivisionBy31556952000000() {
        XCTAssertEqual(divisionBy31556952000000(31556952000000), 1)
    }

    ///
    func testDivisionBy31556952000000000() {
        XCTAssertEqual(divisionBy31556952000000000(31556952000000000), 1)
    }
}
