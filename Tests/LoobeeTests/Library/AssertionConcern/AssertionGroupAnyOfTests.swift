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
import LoobeeAssertionConcern
#endif

internal final class AssertionGroupAnyOfTests: XCTestCase {
    ///
    func testAssignValue() {
        _ = AssertionGroup.anyOf(4) { value, _ in
            XCTAssertEqual(value, 4)
        }
    }

    ///
    func testEmptyBlock() {
        let assertionGroup = AssertionGroup.anyOf("test") { _, _ in }

        XCTAssertTrue(assertionGroup.notifications.isEmpty)
    }

    ///
    func testWithValidAssertions() {
        let assertionGroup = AssertionGroup.anyOf("test") { value, yield in
            yield(assert("t", containedIn: value))
            yield(assert("e", containedIn: value))
            yield(assert("a", notContainedIn: value))
            yield(assert("s", containedIn: value))
        }

        XCTAssertTrue(assertionGroup.notifications.isEmpty)
    }

    ///
    func testExecuteBeforeFirstSuccessful() {
        var callCount = 0

        let checker: (_ container: String, _ value: Character) -> AssertionNotification? = { container, value in
            callCount += 1
            return assert(value, containedIn: container)
        }

        _ = AssertionGroup.anyOf("test") { value, yield in
            yield(checker(value, "a"))
            yield(checker(value, "b"))
            yield(checker(value, "t"))
            yield(checker(value, "e"))
            yield(checker(value, "s"))
            yield(checker(value, "c"))
        }

        XCTAssertEqual(callCount, 3)
    }

    ///
    func testAnyCondition() {
        let assertionGroup = AssertionGroup.anyOf("test") { value, yield in
            yield(assert("a", containedIn: value))
            yield(assert("b", containedIn: value))
            yield(assert("c", containedIn: value))
            yield(assert("d", containedIn: value))
            yield(assert("e", containedIn: value))
            yield(assert("f", containedIn: value))
            yield(assert("g", containedIn: value))
        }

        XCTAssertTrue(assertionGroup.notifications.isEmpty)
    }

    ///
    func testExecuteResultIfAllIsFailed() {
        let assertionGroup = AssertionGroup.anyOf("test") { value, yield in
            yield(assert("a", containedIn: value, orNotification: "FAILA"))
            yield(assert("b", containedIn: value, orNotification: "FAILB"))
        }

        XCTAssertEqual(assertionGroup.notifications.count, 2)
        XCTAssertEqual(assertionGroup.notifications.first?.message, "FAILA")
        XCTAssertEqual(assertionGroup.notifications.last?.message, "FAILB")
    }
}
