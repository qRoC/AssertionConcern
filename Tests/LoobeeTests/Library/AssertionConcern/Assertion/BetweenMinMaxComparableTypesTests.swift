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

internal final class BetweenMinMaxComparableTypesTests: BaseAssertionsTests {
    ///
    func testOutOfRangeMinimum() {
        let value: Character = "a"
        let minValue: Character = "b"
        let maxValue: Character = "d"

        self.assertMustBeNotValid(
            assert(value, between: (minimum: minValue, maximum: maxValue))
        )
    }

    ///
    func testOutOfRangeMaximum() {
        let value: Character = "e"
        let minValue: Character = "b"
        let maxValue: Character = "d"

        self.assertMustBeNotValid(
            assert(value, between: (minimum: minValue, maximum: maxValue))
        )
    }

    ///
    func testMinimumEqual() {
        let value: Character = "b"
        let minValue: Character = "b"
        let maxValue: Character = "d"

        self.assertMustBeValid(assert(value, between: (minimum: minValue, maximum: maxValue)))
    }

    ///
    func testMaximumEqual() {
        let value: Character = "d"
        let minValue: Character = "b"
        let maxValue: Character = "d"

        self.assertMustBeValid(assert(value, between: (minimum: minValue, maximum: maxValue)))
    }

    ///
    func testInRange() {
        let value: Character = "c"
        let minValue: Character = "b"
        let maxValue: Character = "d"

        self.assertMustBeValid(assert(value, between: (minimum: minValue, maximum: maxValue)))
    }

    ///
    func testDefaultMessage() {
        let value: Character = "a"
        let minValue: Character = "b"
        let maxValue: Character = "d"
        let message = kBetweenDefaultMessage.description

        self.assertMustBeNotValid(
            assert(value, between: (minimum: minValue, maximum: maxValue)),
            withMessage: message
        )
    }

    ///
    func testCustomMessage() {
        let value: Character = "a"
        let minValue: Character = "b"
        let maxValue: Character = "d"
        let message = "Test"

        self.assertMustBeNotValid(
            assert(value, between: (minimum: minValue, maximum: maxValue), orNotification: message),
            withMessage: message
        )
    }
}
