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

internal final class AssertionConcernGroupSatsifyTests: XCTestCase {
    ///
    func testWithoutNotifications() {
        XCTAssertNoThrow(try AssertionConcern.groupsSatisfy())
    }

    ///
    func testWithEmptyGroups() {
        XCTAssertNoThrow(try AssertionConcern.groupsSatisfy(
            .lazy(1) { _, _ in },
            .lazy(2) { _, _ in }
        ))
    }

    ///
    func testErrorType() {
        XCTAssertThrowsError(
            try AssertionConcern.groupsSatisfy(
                AssertionGroup([.create(message: "Test1", file: "file1", line: 1)])
            )
        ) { error in
            XCTAssertNotNil(error as? AssertionConcernError)
        }
    }

    ///
    func testErrorContent() {
        let result = AssertionConcernError.notSatisfied(notifications: [
            .create(message: "Test1", file: "file1", line: 1),
            .create(message: "Test2", file: "file2", line: 2),
            .create(message: "Test3", file: "file3", line: 3),
        ])

        XCTAssertThrowsError(
            try AssertionConcern.groupsSatisfy(
                .lazy("Test1") { value, yield in
                    yield(.create(message: value, file: "file1", line: 1))
                },
                .lazy("Test2") { value, yield in
                    yield(.create(message: value, file: "file2", line: 2))
                },
                .lazy("Test3") { value, yield in
                    yield(.create(message: value, file: "file3", line: 3))
                }
            )
        ) { error in
            XCTAssertEqual(error as? AssertionConcernError, result)
        }
    }
}
