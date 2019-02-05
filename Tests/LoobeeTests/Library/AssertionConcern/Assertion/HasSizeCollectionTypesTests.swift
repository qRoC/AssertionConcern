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

final class HasSizeCollectionTypesTests: BaseAssertionsTests {
    ///
    func testHasSizeEmptyArray() {
        self.assertMustBeValid(assert([], hasSize: 0))
    }

    ///
    func testHasSizeSampleArray() {
        self.assertMustBeValid(assert([1, 2, 3], hasSize: 3))
    }

    ///
    func testHasSizeNotValidCase() {
        self.assertMustBeNotValid(
            assert([1, 2, 3], hasSize: 0)
        )
    }

    ///
    func testHasSizeDefaultMessage() {
        let message = kCollectionSizeDefaultMessage.description

        self.assertMustBeNotValid(
            assert([1, 2, 3], hasSize: 0),
            withMessage: message
        )
    }

    ///
    func testHasSizeCustomMessage() {
        let message = "Test"

        self.assertMustBeNotValid(
            assert([1, 2, 3], hasSize: 0, orNotification: message),
            withMessage: message
        )
    }
}
