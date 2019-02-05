// This file is part of the Loobee package.
//
// (c) Andrey Savitsky <contact@qroc.pro>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// Notification about the unsuccessful assertion result.
public struct AssertionNotification: Equatable, CustomStringConvertible, CustomDebugStringConvertible {
    /// Message from assertion.
    public let message: String

    /// File where assertion was called.
    public let file: StaticString

    /// Line where assertion was called.
    public let line: UInt

    ///
    @inlinable
    internal init(message: String, file: StaticString, line: UInt) {
        self.message = message
        self.file = file
        self.line = line
    }

    /// Returns `message`.
    public var description: String {
        return self.message
    }

    /// Returns string in format "[#file:#line] message".
    public var debugDescription: String {
        return "[\(self.file):\(self.line)] \(self.message)"
    }

    /// `AssertionNotification` factory method.
    public static func create(message: String, file: StaticString, line: UInt) -> AssertionNotification {
        return .init(message: message, file: file, line: line)
    }

    ///
    public static func == (lhs: AssertionNotification, rhs: AssertionNotification) -> Bool {
        return lhs.line == rhs.line && lhs.file.utf8Start == rhs.file.utf8Start && lhs.message == rhs.message
    }
}
