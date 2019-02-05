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

internal final class BetweenMinMaxDifferentBinaryIntegerTypesTests: BaseAssertionsTests {
    ///
    func testOutOfRangeMinimum() {
        let value: UInt8 = 1
        let minValue: Int16 = 2
        let maxValue: UInt64 = 4

        self.assertMustBeNotValid(
            assert(value, between: (minimum: minValue, maximum: maxValue))
        )
    }

    ///
    func testOutOfRangeMaximum() {
        let value: UInt8 = 5
        let minValue: Int16 = 2
        let maxValue: UInt64 = 4

        self.assertMustBeNotValid(
            assert(value, between: (minimum: minValue, maximum: maxValue))
        )
    }

    ///
    func testMinimumEqual() {
        let value: UInt8 = 2
        let minValue: Int16 = 2
        let maxValue: UInt64 = 4

        self.assertMustBeValid(assert(value, between: (minimum: minValue, maximum: maxValue)))
    }

    ///
    func testMaximumEqual() {
        let value: UInt8 = 4
        let minValue: Int16 = 2
        let maxValue: UInt64 = 4

        self.assertMustBeValid(assert(value, between: (minimum: minValue, maximum: maxValue)))
    }

    ///
    func testInRange() {
        let value: UInt8 = 3
        let minValue: Int16 = 2
        let maxValue: UInt64 = 4

        self.assertMustBeValid(assert(value, between: (minimum: minValue, maximum: maxValue)))
    }

    ///
    func testDefaultMessage() {
        let value: UInt8 = 1
        let minValue: Int16 = 2
        let maxValue: UInt64 = 4
        let message = kBetweenDefaultMessage.description

        self.assertMustBeNotValid(
            assert(value, between: (minimum: minValue, maximum: maxValue)),
            withMessage: message
        )
    }

    ///
    func testCustomMessage() {
        let value: UInt8 = 1
        let minValue: Int16 = 2
        let maxValue: UInt64 = 4
        let message = "Test"

        self.assertMustBeNotValid(
            assert(value, between: (minimum: minValue, maximum: maxValue), orNotification: message),
            withMessage: message
        )
    }
}
