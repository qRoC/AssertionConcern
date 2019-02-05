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

internal final class BetweenBoundsComparableTypesTests: BaseAssertionsTests {
    ///
    func testOutOfRangeMinimum() {
        let value: Character = "a"
        let lowerBound: Character = "b"
        let upperBound: Character = "d"

        self.assertMustBeNotValid(
            assert(value, between: (lowerBound: lowerBound, upperBound: upperBound))
        )
    }

    ///
    func testOutOfRangeMaximum() {
        let value: Character = "e"
        let lowerBound: Character = "b"
        let upperBound: Character = "d"

        self.assertMustBeNotValid(
            assert(value, between: (lowerBound: lowerBound, upperBound: upperBound))
        )
    }

    ///
    func testMinimumEqual() {
        let value: Character = "b"
        let lowerBound: Character = "b"
        let upperBound: Character = "d"

        self.assertMustBeNotValid(
            assert(value, between: (lowerBound: lowerBound, upperBound: upperBound))
        )
    }

    ///
    func testMaximumEqual() {
        let value: Character = "d"
        let lowerBound: Character = "b"
        let upperBound: Character = "d"

        self.assertMustBeNotValid(
            assert(value, between: (lowerBound: lowerBound, upperBound: upperBound))
        )
    }

    ///
    func testInRange() {
        let value: Character = "c"
        let lowerBound: Character = "b"
        let upperBound: Character = "d"

        self.assertMustBeValid(assert(value, between: (lowerBound: lowerBound, upperBound: upperBound)))
    }

    ///
    func testDefaultMessage() {
        let value: Character = "a"
        let lowerBound: Character = "b"
        let upperBound: Character = "d"
        let message = kBetweenDefaultMessage.description

        self.assertMustBeNotValid(
            assert(value, between: (lowerBound: lowerBound, upperBound: upperBound)),
            withMessage: message
        )
    }

    ///
    func testCustomMessage() {
        let value: Character = "a"
        let lowerBound: Character = "b"
        let upperBound: Character = "d"
        let message = "Test"

        self.assertMustBeNotValid(
            assert(value, between: (lowerBound: lowerBound, upperBound: upperBound), orNotification: message),
            withMessage: message
        )
    }
}
