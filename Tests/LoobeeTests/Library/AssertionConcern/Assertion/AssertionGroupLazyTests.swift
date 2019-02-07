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

internal final class AssertionGroupLazyTests: XCTestCase {
    ///
    func testAssignValue() {
        _ = AssertionGroup.lazy(4) { value, _ in
            XCTAssertEqual(value, 4)
        }
    }

    ///
    func testEmptyBlock() {
        let assertionGroup = AssertionGroup.lazy("test") { _, _ in }

        XCTAssertTrue(assertionGroup.notifications.isEmpty)
    }

    ///
    func testWithValidAssertions() {
        let assertionGroup = AssertionGroup.lazy("test") { value, yield in
            yield(assert("t", containedIn: value))
            yield(assert("e", containedIn: value))
            yield(assert("a", notContainedIn: value))
            yield(assert("s", containedIn: value))
        }

        XCTAssertTrue(assertionGroup.notifications.isEmpty)
    }

    ///
    func testExecuteBeforeFirstFail() {
        var callCount = 0

        let checker: (_ container: String, _ value: Character) -> AssertionNotification? = { container, value in
            callCount += 1
            return assert(value, containedIn: container)
        }

        _ = AssertionGroup.lazy("test") { value, yield in
            yield(checker(value, "t"))
            yield(checker(value, "a"))
            yield(checker(value, "e"))
            yield(checker(value, "b"))
            yield(checker(value, "s"))
            yield(checker(value, "c"))
        }

        XCTAssertEqual(callCount, 2)
    }

    ///
    func testExecuteResultIfFailed() {
        let assertionGroup = AssertionGroup.lazy("test") { value, yield in
            yield(assert("t", containedIn: value))
            yield(assert("e", containedIn: value))
            yield(assert("a", containedIn: value, orNotification: "FAIL"))
            yield(assert("s", containedIn: value))
        }

        XCTAssertEqual(assertionGroup.notifications.count, 1)
        XCTAssertEqual(assertionGroup.notifications.first?.message, "FAIL")
    }
}
