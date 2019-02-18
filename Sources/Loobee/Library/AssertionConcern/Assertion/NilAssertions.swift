// This file is part of the Loobee package.
//
// (c) Andrey Savitsky <contact@qroc.pro>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// The default message in notifications from `isNil` assertions.
@usableFromInline internal let kIsNilDefaultMessage: StaticString = """
The value must be nil.
"""

/// The default message in notifications from `isNotNil` assertions.
@usableFromInline internal let kIsNotNilDefaultMessage: StaticString = """
The value cannot be nil.
"""

/// Determines if the `value` is nil.
@inlinable
public func assert(
    isNil value: Any?,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(value != nil) {
        return .create(
            message: message() ?? kIsNilDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}

/// Determines if the `value` is not nil.
@inlinable
public func assert(
    isNotNil value: Any?,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(value == nil) {
        return .create(
            message: message() ?? kIsNotNilDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}
