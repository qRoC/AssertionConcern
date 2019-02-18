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

internal final class AssertionConcernErrorTests: XCTestCase {
    ///
    func testDescriptionIsNotEmpty() {
        XCTAssertNotEqual(AssertionConcernError.notSatisfied(notifications: []).description, "")
    }

    ///
    func testDescriptionIsNotStatic() {
        let description0 = AssertionConcernError.notSatisfied(notifications: []).description
        let description1 = AssertionConcernError.notSatisfied(notifications: [
            .create(message: "Test1", file: "file1", line: 1),
        ]).description
        let description2 = AssertionConcernError.notSatisfied(notifications: [
            .create(message: "Test1", file: "file1", line: 1),
            .create(message: "Test2", file: "file2", line: 2),
        ]).description

        XCTAssertNotEqual(description0, description1)
        XCTAssertNotEqual(description0, description2)
    }

    ///
    func testDebugDescriptionIsNotEmpty() {
        XCTAssertNotEqual(AssertionConcernError.notSatisfied(notifications: []).debugDescription, "")
    }

    ///
    func testDebugDescriptionIsNotStatic() {
        let description0 = AssertionConcernError.notSatisfied(notifications: []).debugDescription
        let description1 = AssertionConcernError.notSatisfied(notifications: [
            .create(message: "Test1", file: "file1", line: 1),
        ]).debugDescription
        let description2 = AssertionConcernError.notSatisfied(notifications: [
            .create(message: "Test1", file: "file1", line: 1),
            .create(message: "Test2", file: "file2", line: 2),
        ]).debugDescription

        XCTAssertNotEqual(description0, description1)
        XCTAssertNotEqual(description0, description2)
    }
}
