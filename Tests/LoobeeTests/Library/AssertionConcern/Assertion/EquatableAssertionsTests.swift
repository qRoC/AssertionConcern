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

final class EquatableAssertionsTests: BaseAssertionsTests {
    ///
    func testIsEqualToValidCase() {
        self.assertMustBeValid(assert(1, isEqualTo: 1))
    }

    ///
    func testIsEqualToNotValidCase() {
        self.assertMustBeNotValid(
            assert(1, isEqualTo: 2)
        )
    }

    ///
    func testIsNotEqualToValidCase() {
        self.assertMustBeValid(assert(1, isNotEqualTo: 2))
    }

    ///
    func testIsNotEqualToNotValidCase() {
        self.assertMustBeNotValid(
            assert(1, isNotEqualTo: 1)
        )
    }

    ///
    func testIsEqualToDefaultMessage() {
        let message = kIsEqualToDefaultMessage.description

        self.assertMustBeNotValid(
            assert(1, isEqualTo: 2),
            withMessage: message
        )
    }

    ///
    func testIsEqualToCustomMessage() {
        let message = "Test"

        self.assertMustBeNotValid(
            assert(1, isEqualTo: 2, orNotification: message),
            withMessage: message
        )
    }

    ///
    func testIsNotEqualToDefaultMessage() {
        let message = kIsNotEqualToDefaultMessage.description

        self.assertMustBeNotValid(
            assert(1, isNotEqualTo: 1),
            withMessage: message
        )
    }

    ///
    func testIsNotEqualToCustomMessage() {
        let message = "Test"

        self.assertMustBeNotValid(
            assert(1, isNotEqualTo: 1, orNotification: message),
            withMessage: message
        )
    }
}
