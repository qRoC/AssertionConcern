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

internal final class IsBlankBinaryIntegerTypesTests: BaseAssertionsTests {
    ///
    func testIsBlankForZero() {
        self.assertMustBeValid(assert(isBlank: 0))
    }

    ///
    func testIsBlankForPositive() {
        self.assertMustBeNotValid(assert(isBlank: 1))
    }

    ///
    func testIsBlankForNegative() {
        self.assertMustBeNotValid(assert(isBlank: -1))
    }

    ///
    func testIsNotBlankForZero() {
        self.assertMustBeNotValid(assert(isNotBlank: 0))
    }

    ///
    func testIsNotBlankForPositive() {
        self.assertMustBeValid(assert(isNotBlank: 1))
    }

    ///
    func testIsNotBlankForNegative() {
        self.assertMustBeValid(assert(isNotBlank: -1))
    }

    ///
    func testIsBlankDefaultMessage() {
        let message = kIsBlankDefaultMessage.description

        self.assertMustBeNotValid(
            assert(isBlank: 1),
            withMessage: message
        )
    }

    ///
    func testIsBlankCustomMessage() {
        let message = "Test"

        self.assertMustBeNotValid(
            assert(isBlank: 1, orNotification: message),
            withMessage: message
        )
    }

    ///
    func testIsNotBlankDefaultMessage() {
        let message = kIsNotBlankDefaultMessage.description

        self.assertMustBeNotValid(
            assert(isNotBlank: 0),
            withMessage: message
        )
    }

    ///
    func testIsNotBlankCustomMessage() {
        let message = "Test"

        self.assertMustBeNotValid(
            assert(isNotBlank: 0, orNotification: message),
            withMessage: message
        )
    }
}
