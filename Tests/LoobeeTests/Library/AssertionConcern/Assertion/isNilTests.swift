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

internal final class IsNilTests: BaseAssertionsTests {
    ///
    func testIsNilForNilValue() {
        self.assertMustBeValid(assert(isNil: nil))
    }

    ///
    func testIsNilForNotNilValue() {
        self.assertMustBeNotValid(assert(isNil: 123))
    }

    ///
    func testIsNotNilForNilValue() {
        self.assertMustBeNotValid(assert(isNotNil: nil))
    }

    ///
    func testIsNotNilForNotNilValue() {
        self.assertMustBeValid(assert(isNotNil: 123))
    }

    ///
    func testIsNilDefaultMessage() {
        let message = kIsNilDefaultMessage.description

        self.assertMustBeNotValid(
            assert(isNil: 1),
            withMessage: message
        )
    }

    ///
    func testIsNilCustomMessage() {
        let message = "Test"

        self.assertMustBeNotValid(
            assert(isNil: "", orNotification: message),
            withMessage: message
        )
    }

    ///
    func testIsNotNilDefaultMessage() {
        let message = kIsNotNilDefaultMessage.description

        self.assertMustBeNotValid(
            assert(isNotNil: nil),
            withMessage: message
        )
    }

    ///
    func testIsNotNilCustomMessage() {
        let message = "Test"

        self.assertMustBeNotValid(
            assert(isNotNil: nil, orNotification: message),
            withMessage: message
        )
    }
}
