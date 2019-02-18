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

internal final class IsBlankStringTypesTests: BaseAssertionsTests {
    ///
    internal let newLineString = "\u{000A}\u{000B}\u{000C}\u{000D}\u{0085}\u{2028}\u{2029}"

    ///
    internal let whitespaceString = "\u{0009}\u{0020}\u{2029}\u{3000}"

    ///
    func testIsBlankForEmptyString() {
        self.assertMustBeValid(assert(isBlank: ""))
    }

    ///
    func testIsBlankForNewlineString() {
        self.assertMustBeValid(assert(isBlank: newLineString))
    }

    ///
    func testIsBlankForWhitespaceString() {
        self.assertMustBeValid(assert(isBlank: whitespaceString))
    }

    ///
    func testIsBlankForNotEmptyString() {
        self.assertMustBeNotValid(assert(isBlank: "a"))
    }

    ///
    func testIsBlankForNotNewlineString() {
        let testString = newLineString + "a" + newLineString

        self.assertMustBeNotValid(assert(isBlank: testString))
    }

    ///
    func testIsBlankForNotWhitespaceString() {
        let testString = whitespaceString + "a" + whitespaceString

        self.assertMustBeNotValid(assert(isBlank: testString))
    }

    ///
    func testIsNotBlankForEmptyString() {
        self.assertMustBeNotValid(assert(isNotBlank: ""))
    }

    ///
    func testIsNotBlankForNewlineString() {
        self.assertMustBeNotValid(assert(isNotBlank: newLineString))
    }

    ///
    func testIsNotBlankForWhitespaceString() {
        self.assertMustBeNotValid(assert(isNotBlank: whitespaceString))
    }

    ///
    func testIsNotBlankForNotEmptyString() {
        self.assertMustBeValid(assert(isNotBlank: "a"))
    }

    ///
    func testIsNotBlankForNotNewlineString() {
        let testString = newLineString + "a" + newLineString

        self.assertMustBeValid(assert(isNotBlank: testString))
    }

    ///
    func testIsNotBlankForNotWhitespaceString() {
        let testString = whitespaceString + "a" + whitespaceString

        self.assertMustBeValid(assert(isNotBlank: testString))
    }

    ///
    func testIsBlankDefaultMessage() {
        let message = kIsBlankDefaultMessage.description

        self.assertMustBeNotValid(
            assert(isBlank: "a"),
            withMessage: message
        )
    }

    ///
    func testIsBlankCustomMessage() {
        let message = "Test"

        self.assertMustBeNotValid(
            assert(isBlank: "a", orNotification: message),
            withMessage: message
        )
    }

    ///
    func testIsNotBlankDefaultMessage() {
        let message = kIsNotBlankDefaultMessage.description

        self.assertMustBeNotValid(
            assert(isNotBlank: ""),
            withMessage: message
        )
    }

    ///
    func testIsNotBlankCustomMessage() {
        let message = "Test"

        self.assertMustBeNotValid(
            assert(isNotBlank: "", orNotification: message),
            withMessage: message
        )
    }
}
