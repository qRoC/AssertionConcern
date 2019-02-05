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

internal final class BetweenBoundsDifferentBinaryIntegerTypesTests: BaseAssertionsTests {
    ///
    func testOutOfRangeMinimum() {
        let value: UInt8 = 1
        let lowerBound: Int16 = 2
        let upperBound: UInt64 = 4

        self.assertMustBeNotValid(
            assert(value, between: (lowerBound: lowerBound, upperBound: upperBound))
        )
    }

    ///
    func testOutOfRangeMaximum() {
        let value: UInt8 = 5
        let lowerBound: Int16 = 2
        let upperBound: UInt64 = 4

        self.assertMustBeNotValid(
            assert(value, between: (lowerBound: lowerBound, upperBound: upperBound))
        )
    }

    ///
    func testMinimumEqual() {
        let value: UInt8 = 2
        let lowerBound: Int16 = 2
        let upperBound: UInt64 = 4

        self.assertMustBeNotValid(
            assert(value, between: (lowerBound: lowerBound, upperBound: upperBound))
        )
    }

    ///
    func testMaximumEqual() {
        let value: UInt8 = 4
        let lowerBound: Int16 = 2
        let upperBound: UInt64 = 4

        self.assertMustBeNotValid(
            assert(value, between: (lowerBound: lowerBound, upperBound: upperBound))
        )
    }

    ///
    func testInRange() {
        let value: UInt8 = 3
        let lowerBound: Int16 = 2
        let upperBound: UInt64 = 4

        self.assertMustBeValid(assert(value, between: (lowerBound: lowerBound, upperBound: upperBound)))
    }

    ///
    func testDefaultMessage() {
        let value: UInt8 = 1
        let lowerBound: Int16 = 2
        let upperBound: UInt64 = 4
        let message = kBetweenDefaultMessage.description

        self.assertMustBeNotValid(
            assert(value, between: (lowerBound: lowerBound, upperBound: upperBound)),
            withMessage: message
        )
    }

    ///
    func testCustomMessage() {
        let value: UInt8 = 1
        let lowerBound: Int16 = 2
        let upperBound: UInt64 = 4
        let message = "Test"

        self.assertMustBeNotValid(
            assert(value, between: (lowerBound: lowerBound, upperBound: upperBound), orNotification: message),
            withMessage: message
        )
    }
}
