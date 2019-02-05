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

internal final class BoolAssertionsTests: BaseAssertionsTests {
    ///
    func testIsTrueValidCase() {
        self.assertMustBeValid(assert(isTrue: true))
    }

    ///
    func testIsTrueNotValidCase() {
        self.assertMustBeNotValid(
            assert(isTrue: false)
        )
    }

    ///
    func testIsFalseValidCase() {
        self.assertMustBeValid(assert(isFalse: false))
    }

    ///
    func testIsFalseNotValidCase() {
        self.assertMustBeNotValid(
            assert(isFalse: true)
        )
    }

    ///
    func testIsTrueDefaultMessage() {
        let message = kIsTrueDefaultMessage.description

        self.assertMustBeNotValid(
            assert(isTrue: false),
            withMessage: message
        )
    }

    ///
    func testIsTrueCustomMessage() {
        let message = "Test"

        self.assertMustBeNotValid(
            assert(isTrue: false, orNotification: message),
            withMessage: message
        )
    }

    ///
    func testIsFalseDefaultMessage() {
        let message = kIsFalseDefaultMessage.description

        self.assertMustBeNotValid(
            assert(isFalse: true),
            withMessage: message
        )
    }

    ///
    func testIsFalseCustomMessage() {
        let message = "Test"

        self.assertMustBeNotValid(
            assert(isFalse: true, orNotification: message),
            withMessage: message
        )
    }
}
