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
import AssertionConcern
#endif

internal final class AssertionGroupAllTests: XCTestCase {
    ///
    func testAssignValue() {
        _ = AssertionGroup.all(4) { value, _ in
            XCTAssertEqual(value, 4)
        }
    }

    ///
    func testEmptyBlock() {
        let assertionGroup = AssertionGroup.all("test") { _, _ in }

        XCTAssertTrue(assertionGroup.notifications.isEmpty)
    }

    ///
    func testWithValidAssertions() {
        let assertionGroup = AssertionGroup.all("test") { value, yield in
            yield(assert("t", containedIn: value))
            yield(assert("e", containedIn: value))
            yield(assert("a", notContainedIn: value))
            yield(assert("s", containedIn: value))
        }

        XCTAssertTrue(assertionGroup.notifications.isEmpty)
    }

    ///
    func testExecuteResultIfFailed() {
        let assertionGroup = AssertionGroup.all("test") { value, yield in
            yield(assert("t", containedIn: value))
            yield(assert("e", containedIn: value))
            yield(assert("a", containedIn: value, orNotification: "FAIL"))
            yield(assert("s", containedIn: value))
            yield(assert("b", containedIn: value, orNotification: "FAIL2"))
        }

        XCTAssertEqual(assertionGroup.notifications.count, 2)
        XCTAssertEqual(assertionGroup.notifications.first?.message, "FAIL")
        XCTAssertEqual(assertionGroup.notifications.last?.message, "FAIL2")
    }
}
