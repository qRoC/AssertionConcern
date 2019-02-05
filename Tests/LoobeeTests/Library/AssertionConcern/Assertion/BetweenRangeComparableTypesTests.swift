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

internal final class BetweenRangeComparableTypesTests: BaseAssertionsTests {
    ///
    func testOutOfRangeMinimum() {
        let value = 1
        let range = 2..<5

        self.assertMustBeNotValid(
            assert(value, between: range)
        )
    }

    ///
    func testOutOfRangeMaximum() {
        let value = 6
        let range = 2..<5

        self.assertMustBeNotValid(
            assert(value, between: range)
        )
    }

    ///
    func testMinimumEqual() {
        let value = 2
        let range = 2..<5

        self.assertMustBeValid(assert(value, between: range))
    }

    ///
    func testMaximumEqual() {
        let value = 5
        let range = 2..<5

        self.assertMustBeNotValid(
            assert(value, between: range)
        )
    }

    ///
    func testInRange() {
        let value = 4
        let range = 2..<5

        self.assertMustBeValid(assert(value, between: range))
    }

    ///
    func testDefaultMessage() {
        let value = 1
        let range = 2..<5
        let message = kBetweenDefaultMessage.description

        self.assertMustBeNotValid(
            assert(value, between: range),
            withMessage: message
        )
    }

    ///
    func testCustomMessage() {
        let value = 1
        let range = 2..<5
        let message = "Test"

        self.assertMustBeNotValid(
            assert(value, between: range, orNotification: message),
            withMessage: message
        )
    }
}
