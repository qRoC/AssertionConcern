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

internal final class StartsEndsTests: BaseAssertionsTests {
    ///
    func testStartsWithStringValidCase() {
        self.assertMustBeValid(assert("hello", startsWith: "hel"))
    }

    ///
    func testStartsWithEmptyRequiredString() {
        self.assertMustBeValid(assert("hello", startsWith: ""))
    }

    ///
    func testStartsWithSubstringValidCase() {
        let testString = "hello"
        self.assertMustBeValid(assert(testString, startsWith: testString.prefix(3)))
    }

    ///
    func testStartsWithStringNotValidCase() {
        self.assertMustBeNotValid(assert("hello", startsWith: "elo"))
    }

    ///
    func testStartsWithSubstringNotValidCase() {
        let testString = "hello"
        self.assertMustBeNotValid(assert(testString, startsWith: testString.dropFirst().prefix(3)))
    }

    ///
    func testEndsWithStringValidCase() {
        self.assertMustBeValid(assert("hello", endsWith: "llo"))
    }

    ///
    func testEndsWithEmptyRequiredString() {
        self.assertMustBeValid(assert("hello", endsWith: ""))
    }

    ///
    func testEndsWithSubstringValidCase() {
        let testString = "hello"
        self.assertMustBeValid(assert(testString, endsWith: testString.suffix(3)))
    }

    ///
    func testEndsWithStringNotValidCase() {
        self.assertMustBeNotValid(assert("hello", endsWith: "ell"))
    }

    ///
    func testEndsWithSubstringNotValidCase() {
        let testString = "hello"
        self.assertMustBeNotValid(assert(testString, endsWith: testString.dropLast().suffix(3)))
    }

    ///
    func testStartsWithDefaultMessage() {
        let message = kStartsWithDefaultMessage.description

        self.assertMustBeNotValid(
            assert("b", startsWith: "a"),
            withMessage: message
        )
    }

    ///
    func testStartsWithCustomMessage() {
        let message = "Test"

        self.assertMustBeNotValid(
            assert("b", startsWith: "a", orNotification: message),
            withMessage: message
        )
    }

    ///
    func testEndsWithDefaultMessage() {
        let message = kEndsWithDefaultMessage.description

        self.assertMustBeNotValid(
            assert("b", endsWith: "a"),
            withMessage: message
        )
    }

    ///
    func testEndsWithCustomMessage() {
        let message = "Test"

        self.assertMustBeNotValid(
            assert("b", endsWith: "a", orNotification: message),
            withMessage: message
        )
    }
}
