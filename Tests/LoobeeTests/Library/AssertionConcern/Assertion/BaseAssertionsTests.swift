// This file is part of the Loobee package.
//
// (c) Andrey Savitsky <contact@qroc.pro>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import XCTest
#if canImport(Loobee)
import Loobee
#else
import AssertionConcern
#endif

/// Contains base methods for check assertions result.
internal class BaseAssertionsTests: XCTestCase {
    /// Checks result of assertion. The `result` must be nil.
    @inline(__always)
    internal func assertMustBeValid(
        _ notification: AssertionNotification?,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        XCTAssertNil(
            notification,
            "Assertion result must be nil, but returned '\(notification.debugDescription)'.",
            file: file,
            line: line
        )
    }

    /// Checks result of assertion without check content of `message` field.
    ///
    /// - Note: Each argument of this method must be declared on a new line. For example:
    ///
    ///       assertMustBeNotValid(
    ///           assert(...)
    ///       )
    ///
    internal func assertMustBeNotValid(
        _ notification: AssertionNotification?,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        XCTAssertNotNil(
            notification,
            "Assertion result is nil.",
            file: file,
            line: line
        )
        XCTAssertEqual(notification?.file.utf8Start, file.utf8Start, "Bad `file` value", file: file, line: line)
        XCTAssertEqual(notification?.line, line, "Bad `line` value", file: file, line: line)
    }

    /// Checks result of assertion.
    ///
    /// - Note: Each argument of this method must be declared on a new line. For example:
    ///
    ///       assertMustBeNotValid(
    ///           assert(...),
    ///           withMessage: "..."
    ///       )
    ///
    internal func assertMustBeNotValid(
        _ notification: AssertionNotification?,
        withMessage message: String,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        XCTAssertNotNil(
            notification,
            "Assertion result is nil.",
            file: file,
            line: line
        )
        XCTAssertEqual(notification?.message, message, "Bad `message` value", file: file, line: line)
        XCTAssertEqual(notification?.file.utf8Start, file.utf8Start, "Bad `file` value", file: file, line: line)
        XCTAssertEqual(notification?.line, line + 1, "Bad `line` value", file: file, line: line)
    }
}
