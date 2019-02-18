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

internal final class IsEmptyStringTypeTests: BaseAssertionsTests {
    ///
    func testIsEmptyForEmptyString() {
        self.assertMustBeValid(assert(isEmpty: ""))
    }

    ///
    func testIsEmptyForStringWithSpace() {
        self.assertMustBeNotValid(assert(isEmpty: " "))
    }

    ///
    func testIsEmptyForNotEmptyString() {
        self.assertMustBeNotValid(assert(isEmpty: "Hello"))
    }

    ///
    func testIsNotEmptyForEmptyString() {
        self.assertMustBeNotValid(assert(isNotEmpty: ""))
    }

    ///
    func testIsNotEmptyForStringWithSpace() {
        self.assertMustBeValid(assert(isNotEmpty: " "))
    }

    ///
    func testIsNotEmptyForNotEmptyString() {
        self.assertMustBeValid(assert(isNotEmpty: "Hello"))
    }

    ///
    func testIsEmptyDefaultMessage() {
        let message = kIsEmptyDefaultMessage.description

        self.assertMustBeNotValid(
            assert(isEmpty: " "),
            withMessage: message
        )
    }

    ///
    func testIsEmptyCustomMessage() {
        let message = "Test"

        self.assertMustBeNotValid(
            assert(isEmpty: " ", orNotification: message),
            withMessage: message
        )
    }

    ///
    func testIsNotEmptyDefaultMessage() {
        let message = kIsNotEmptyDefaultMessage.description

        self.assertMustBeNotValid(
            assert(isNotEmpty: ""),
            withMessage: message
        )
    }

    ///
    func testIsNotEmptyCustomMessage() {
        let message = "Test"

        self.assertMustBeNotValid(
            assert(isNotEmpty: "", orNotification: message),
            withMessage: message
        )
    }
}
