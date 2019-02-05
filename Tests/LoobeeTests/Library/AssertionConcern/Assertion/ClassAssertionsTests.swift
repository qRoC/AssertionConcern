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

internal final class ClassAssertionsTests: BaseAssertionsTests {
    ///
    func testIsSameInstanceAsValidCase() {
        self.assertMustBeValid(assert(\Int.self, isSameInstanceAs: \Int.self))
    }

    ///
    func testIsSameInstanceAsNotValidCase() {
        self.assertMustBeNotValid(
            assert(\Int.self, isSameInstanceAs: \UInt.self)
        )
    }

    ///
    func testIsNotSameInstanceAsValidCase() {
        self.assertMustBeValid(assert(\Int.self, isNotSameInstanceAs: \UInt.self))
    }

    ///
    func testIsNotSameInstanceAsNotValidCase() {
        self.assertMustBeNotValid(
            assert(\Int.self, isNotSameInstanceAs: \Int.self)
        )
    }

    ///
    func testIsSameInstanceAsDefaultMessage() {
        let message = kIsSameInstanceAsDefaultMessage.description

        self.assertMustBeNotValid(
            assert(\Int.self, isSameInstanceAs: \UInt.self),
            withMessage: message
        )
    }

    ///
    func testIsSameInstanceAsCustomMessage() {
        let message = "Test"

        self.assertMustBeNotValid(
            assert(\Int.self, isSameInstanceAs: \UInt.self, orNotification: message),
            withMessage: message
        )
    }

    ///
    func testIsNotSameInstanceAsDefaultMessage() {
        let message = kIsNotSameInstanceAsDefaultMessage.description

        self.assertMustBeNotValid(
            assert(\Int.self, isNotSameInstanceAs: \Int.self),
            withMessage: message
        )
    }

    ///
    func testIsNotSameInstanceAsCustomMessage() {
        let message = "Test"

        self.assertMustBeNotValid(
            assert(\Int.self, isNotSameInstanceAs: \Int.self, orNotification: message),
            withMessage: message
        )
    }
}
