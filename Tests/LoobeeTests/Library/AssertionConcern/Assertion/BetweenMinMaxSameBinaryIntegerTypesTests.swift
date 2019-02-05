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

internal final class BetweenMinMaxSameBinaryIntegerTypesTests: BaseAssertionsTests {
    ///
    func testOutOfRangeMinimum() {
        let value = 1
        let minValue = 2
        let maxValue = 4

        self.assertMustBeNotValid(
            assert(value, between: (minimum: minValue, maximum: maxValue))
        )
    }

    ///
    func testOutOfRangeMaximum() {
        let value = 5
        let minValue = 2
        let maxValue = 4

        self.assertMustBeNotValid(
            assert(value, between: (minimum: minValue, maximum: maxValue))
        )
    }

    ///
    func testMinimumEqual() {
        let value = 2
        let minValue = 2
        let maxValue = 4

        self.assertMustBeValid(assert(value, between: (minimum: minValue, maximum: maxValue)))
    }

    ///
    func testMaximumEqual() {
        let value = 4
        let minValue = 2
        let maxValue = 4

        self.assertMustBeValid(assert(value, between: (minimum: minValue, maximum: maxValue)))
    }

    ///
    func testInRange() {
        let value = 3
        let minValue = 2
        let maxValue = 4

        self.assertMustBeValid(assert(value, between: (minimum: minValue, maximum: maxValue)))
    }

    ///
    func testDefaultMessage() {
        let value = 1
        let minValue = 2
        let maxValue = 4
        let message = kBetweenDefaultMessage.description

        self.assertMustBeNotValid(
            assert(value, between: (minimum: minValue, maximum: maxValue)),
            withMessage: message
        )
    }

    ///
    func testCustomMessage() {
        let value = 1
        let minValue = 2
        let maxValue = 4
        let message = "Test"

        self.assertMustBeNotValid(
            assert(value, between: (minimum: minValue, maximum: maxValue), orNotification: message),
            withMessage: message
        )
    }
}
