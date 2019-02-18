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
@testable import LoobeeAssertionConcern
#endif

internal final class LessOrEqualThanSameBinaryIntegerTypesTests: BaseAssertionsTests {
    ///
    func testLessCondition() {
        let a = 10
        let b = 11

        self.assertMustBeValid(assert(a, lessOrEqualThan: b))
    }

    ///
    func testEqualCondition() {
        let a = 10
        let b = 10

        self.assertMustBeValid(assert(a, lessOrEqualThan: b))
    }

    ///
    func testGreaterCondition() {
        let a = 11
        let b = 10

        self.assertMustBeNotValid(
            assert(a, lessOrEqualThan: b)
        )
    }

    ///
    func testDefaultMessage() {
        let a = 11
        let b = 10
        let message = kLessOrEqualThanDefaultMessage.description

        self.assertMustBeNotValid(
            assert(a, lessOrEqualThan: b),
            withMessage: message
        )
    }

    ///
    func testCustomMessage() {
        let a = 11
        let b = 10
        let message = "Test"

        self.assertMustBeNotValid(
            assert(a, lessOrEqualThan: b, orNotification: message),
            withMessage: message
        )
    }
}
