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

internal final class BetweenPartialRangeThroughComparableTypesTests: BaseAssertionsTests {
    ///
    func testOutOfRangeMaximum() {
        let value = 6
        let range = ...5

        self.assertMustBeNotValid(
            assert(value, between: range)
        )
    }

    ///
    func testMaximumEqual() {
        let value = 5
        let range = ...5

        self.assertMustBeValid(
            assert(value, between: range)
        )
    }

    ///
    func testInRange() {
        let value = Int.min
        let range = ...5

        self.assertMustBeValid(assert(value, between: range))
    }

    ///
    func testDefaultMessage() {
        let value = 6
        let range = ...5
        let message = kBetweenDefaultMessage.description

        self.assertMustBeNotValid(
            assert(value, between: range),
            withMessage: message
        )
    }

    ///
    func testCustomMessage() {
        let value = 6
        let range = ...5
        let message = "Test"

        self.assertMustBeNotValid(
            assert(value, between: range, orNotification: message),
            withMessage: message
        )
    }
}
