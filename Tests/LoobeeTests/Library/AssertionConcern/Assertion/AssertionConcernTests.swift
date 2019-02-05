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

internal final class AssertionConcernTests: XCTestCase {
    ///
    func testSatisfyWithoutNotifications() {
            XCTAssertNoThrow(try AssertionConcern.satisfy())
    }

    ///
    func testSatisfyWithNilArguments() {
        XCTAssertNoThrow(try AssertionConcern.satisfy(nil, nil, nil, nil, nil))
    }

    ///
    func testSatisfyErrorType() {
        XCTAssertThrowsError(
            try AssertionConcern.satisfy(
                .create(message: "Test1", file: "file1", line: 1)
            )
        ) { error in
            XCTAssertNotNil(error as? AssertionConcernError)
        }
    }

    ///
    func testSatisfyErrorContent() {
        let result = AssertionConcernError.notSatisfied(notifications: [
            .create(message: "Test1", file: "file1", line: 1),
            .create(message: "Test2", file: "file2", line: 2),
            .create(message: "Test3", file: "file3", line: 3),
        ])
        XCTAssertThrowsError(
            try AssertionConcern.satisfy(
                nil,
                .create(message: "Test1", file: "file1", line: 1),
                nil,
                nil,
                .create(message: "Test2", file: "file2", line: 2),
                nil,
                .create(message: "Test3", file: "file3", line: 3),
                nil
            )
        ) { error in
            XCTAssertEqual(error as? AssertionConcernError, result)
        }
    }
}
