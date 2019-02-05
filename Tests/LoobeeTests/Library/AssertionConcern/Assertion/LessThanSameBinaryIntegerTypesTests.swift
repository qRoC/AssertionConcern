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

internal final class LessThanSameBinaryIntegerTypesTests: BaseAssertionsTests {
    ///
    func testLessCondition() {
        let a = 10
        let b = 11

        self.assertMustBeValid(assert(a, lessThan: b))
    }

    ///
    func testEqualCondition() {
        let a = 10
        let b = 10

        self.assertMustBeNotValid(
            assert(a, lessThan: b)
        )
    }

    ///
    func testGreaterCondition() {
        let a = 11
        let b = 10

        self.assertMustBeNotValid(
            assert(a, lessThan: b)
        )
    }

    ///
    func testDefaultMessage() {
        let a = 11
        let b = 10
        let message = kLessThanDefaultMessage.description

        self.assertMustBeNotValid(
            assert(a, lessThan: b),
            withMessage: message
        )
    }

    ///
    func testCustomMessage() {
        let a = 11
        let b = 10
        let message = "Test"

        self.assertMustBeNotValid(
            assert(a, lessThan: b, orNotification: message),
            withMessage: message
        )
    }
}
