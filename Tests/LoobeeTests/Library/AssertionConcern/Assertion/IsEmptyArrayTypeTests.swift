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

internal final class IsEmptyArrayTypeTests: BaseAssertionsTests {
    ///
    func testIsEmptyForEmptyString() {
        self.assertMustBeValid(assert(isEmpty: []))
    }

    ///
    func testIsEmptyForNotEmptyString() {
        self.assertMustBeNotValid(assert(isEmpty: [0]))
    }

    ///
    func testIsNotEmptyForEmptyString() {
        self.assertMustBeNotValid(assert(isNotEmpty: []))
    }

    ///
    func testIsNotEmptyForNotEmptyString() {
        self.assertMustBeValid(assert(isNotEmpty: [0]))
    }

    ///
    func testIsEmptyDefaultMessage() {
        let message = kIsEmptyDefaultMessage.description

        self.assertMustBeNotValid(
            assert(isEmpty: [0]),
            withMessage: message
        )
    }

    ///
    func testIsEmptyCustomMessage() {
        let message = "Test"

        self.assertMustBeNotValid(
            assert(isEmpty: [0], orNotification: message),
            withMessage: message
        )
    }

    ///
    func testIsNotEmptyDefaultMessage() {
        let message = kIsNotEmptyDefaultMessage.description

        self.assertMustBeNotValid(
            assert(isNotEmpty: []),
            withMessage: message
        )
    }

    ///
    func testIsNotEmptyCustomMessage() {
        let message = "Test"

        self.assertMustBeNotValid(
            assert(isNotEmpty: [], orNotification: message),
            withMessage: message
        )
    }
}
