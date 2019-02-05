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
@testable import AssertionConcern
#endif

internal final class GreaterThanComparableTypesTests: BaseAssertionsTests {
    ///
    func testLessCondition() {
        let a: Character = "a"
        let b: Character = "b"

        self.assertMustBeNotValid(
            assert(a, greaterThan: b)
        )
    }

    ///
    func testEqualCondition() {
        let a: Character = "a"
        let b: Character = "a"

        self.assertMustBeNotValid(
            assert(a, greaterThan: b)
        )
    }

    ///
    func testGreaterCondition() {
        let a: Character = "b"
        let b: Character = "a"

        self.assertMustBeValid(assert(a, greaterThan: b))
    }

    ///
    func testDefaultMessage() {
        let a: Character = "a"
        let b: Character = "b"
        let message = kGreaterThanDefaultMessage.description

        self.assertMustBeNotValid(
            assert(a, greaterThan: b),
            withMessage: message
        )
    }

    ///
    func testCustomMessage() {
        let a: Character = "a"
        let b: Character = "b"
        let message = "Test"

        self.assertMustBeNotValid(
            assert(a, greaterThan: b, orNotification: message),
            withMessage: message
        )
    }
}
