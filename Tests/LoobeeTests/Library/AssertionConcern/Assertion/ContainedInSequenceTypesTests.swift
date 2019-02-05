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

internal final class ContainedInSequenceTypesTests: BaseAssertionsTests {
    ///
    func testContainedInSampleArray() {
        self.assertMustBeValid(assert(4, containedIn: [1, 2, 3, 4, 5]))
    }

    ///
    func testContainedInEmptyArray() {
        self.assertMustBeNotValid(
            assert(0, containedIn: [])
        )
    }

    ///
    func testContainedInNotValidCase() {
        self.assertMustBeNotValid(
            assert(6, containedIn: [1, 2, 3, 4, 5])
        )
    }

    ///
    func testNotContainedInSampleArray() {
        self.assertMustBeValid(assert(4, notContainedIn: [1, 2, 3, 5]))
    }

    ///
    func testNotContainedInEmptyArray() {
        self.assertMustBeValid(assert(0, notContainedIn: []))
    }

    ///
    func testNotContainedInNotValidCase() {
        self.assertMustBeNotValid(
            assert(1, notContainedIn: [1, 2, 3, 4, 5])
        )
    }

    ///
    func testContainedInDefaultMessage() {
        let message = kSequenceContainedInDefaultMessage.description

        self.assertMustBeNotValid(
            assert(1, containedIn: []),
            withMessage: message
        )
    }

    ///
    func testContainedInCustomMessage() {
        let message = "Test"

        self.assertMustBeNotValid(
            assert(1, containedIn: [], orNotification: message),
            withMessage: message
        )
    }

    ///
    func testNotContainedInDefaultMessage() {
        let message = kSequenceNotContainedInDefaultMessage.description

        self.assertMustBeNotValid(
            assert(1, notContainedIn: [1]),
            withMessage: message
        )
    }

    ///
    func testNotContainedInCustomMessage() {
        let message = "Test"

        self.assertMustBeNotValid(
            assert(1, notContainedIn: [1], orNotification: message),
            withMessage: message
        )
    }
}
