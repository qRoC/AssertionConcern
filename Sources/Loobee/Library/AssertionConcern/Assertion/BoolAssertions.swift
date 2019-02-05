// This file is part of the Loobee package.
//
// (c) Andrey Savitsky <contact@qroc.pro>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// The default message in notifications from `isTrue` assertions.
@usableFromInline internal let kIsTrueDefaultMessage: StaticString = """
The value must be true.
"""

/// The default message in notifications from `isFalse` assertions.
@usableFromInline internal let kIsFalseDefaultMessage: StaticString = """
The value must be false.
"""

/// Determines if the `value` is true.
@inlinable
public func assert(
    isTrue value: Bool,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(!value) {
        return .create(
            message: message() ?? kIsTrueDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}

/// Determines if the `value` is false.
@inlinable
public func assert(
    isFalse value: Bool,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(value) {
        return .create(
            message: message() ?? kIsFalseDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}
