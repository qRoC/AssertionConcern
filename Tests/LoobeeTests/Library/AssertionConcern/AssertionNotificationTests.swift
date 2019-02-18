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
import LoobeeAssertionConcern
#endif

internal final class AssertionNotificationTests: XCTestCase {
    ///
    func testCreateMethod() {
        let message: String = "testMessasge"
        let file: StaticString = "testFile"
        let line: UInt = 42

        let notification = AssertionNotification.create(
            message: message,
            file: file,
            line: line
        )

        XCTAssertEqual(notification.message, message)
        XCTAssertEqual(notification.file.utf8Start, file.utf8Start)
        XCTAssertEqual(notification.line, line)
    }

    ///
    func testCreateMethodWithEmptyData() {
        let message: String = ""
        let file: StaticString = ""
        let line: UInt = 0

        let notification = AssertionNotification.create(
            message: message,
            file: file,
            line: line
        )

        XCTAssertEqual(notification.message, message)
        XCTAssertEqual(notification.file.utf8Start, file.utf8Start)
        XCTAssertEqual(notification.line, line)
    }

    ///
    func testCustomStringConvertible() {
        let notification = AssertionNotification.create(
            message: "testMessasge",
            file: "file",
            line: 42
        )

        XCTAssertEqual(notification.message, notification.description)
    }

    ///
    func testCustomDebugStringConvertible() {
        let message: String = "testMessasge"
        let file: StaticString = "testFile"
        let line: UInt = 42

        let notification = AssertionNotification.create(
            message: message,
            file: file,
            line: line
        )

        let debugDescription = "[\(file):\(line)] \(message)"

        XCTAssertEqual(notification.debugDescription, debugDescription)
    }

    ///
    func testEquatableWithSameData() {
        let notification = AssertionNotification.create(
            message: "testMessasge",
            file: "file",
            line: 42
        )

        XCTAssertEqual(notification, notification)
    }

    ///
    func testEquatableWithDifferentMessage() {
        let file: StaticString = ""
        let line: UInt = 0

        let notification = AssertionNotification.create(
            message: "",
            file: file,
            line: line
        )

        let notification2 = AssertionNotification.create(
            message: "a",
            file: file,
            line: line
        )

        XCTAssertNotEqual(notification, notification2)
    }

    ///
    func testEquatableWithDifferentFile() {
        let message: String = ""
        let line: UInt = 0

        let notification = AssertionNotification.create(
            message: message,
            file: "",
            line: line
        )

        let notification2 = AssertionNotification.create(
            message: message,
            file: "a",
            line: line
        )

        XCTAssertNotEqual(notification, notification2)
    }

    ///
    func testEquatableWithDifferentLine() {
        let message: String = ""
        let file: StaticString = ""

        let notification = AssertionNotification.create(
            message: message,
            file: file,
            line: 0
        )

        let notification2 = AssertionNotification.create(
            message: message,
            file: file,
            line: 1
        )

        XCTAssertNotEqual(notification, notification2)
    }
}
