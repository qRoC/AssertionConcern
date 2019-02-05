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

final class LessOrEqualThanDifferentBinaryIntegerTypesTests: BaseAssertionsTests {
    ///
    func testLessCondition() {
        let a: Int16 = 10
        let b: UInt8 = 11

        self.assertMustBeValid(assert(a, lessOrEqualThan: b))
    }

    ///
    func testEqualCondition() {
        let a: Int16 = 10
        let b: UInt8 = 10

        self.assertMustBeValid(assert(a, lessOrEqualThan: b))
    }

    ///
    func testGreaterCondition() {
        let a: Int16 = 11
        let b: UInt8 = 10

        self.assertMustBeNotValid(
            assert(a, lessOrEqualThan: b)
        )
    }

    ///
    func testDefaultMessage() {
        let a: Int16 = 11
        let b: UInt8 = 10
        let message = kLessOrEqualThanDefaultMessage.description

        self.assertMustBeNotValid(
            assert(a, lessOrEqualThan: b),
            withMessage: message
        )
    }

    ///
    func testCustomMessage() {
        let a: Int16 = 11
        let b: UInt8 = 10
        let message = "Test"

        self.assertMustBeNotValid(
            assert(a, lessOrEqualThan: b, orNotification: message),
            withMessage: message
        )
    }
}
