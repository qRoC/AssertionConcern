// This file is part of the Loobee package.
//
// (c) Andrey Savitsky <contact@qroc.pro>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// The default message in notifications from `isEmpty` assertions.
@usableFromInline internal let kIsEmptyDefaultMessage: StaticString = """
The value must be empty.
"""

/// The default message in notifications from `isNotEmpty` assertions.
@usableFromInline internal let kIsNotEmptyDefaultMessage: StaticString = """
The value cannot be empty.
"""

/// Determines if the `value` is empty.
@inlinable
public func assert<T: Collection>(
    isEmpty value: T,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(!value.isEmpty) {
        return .create(
            message: message() ?? kIsEmptyDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}

/// Determines if the `value` is not empty.
@inlinable
public func assert<T: Collection>(
    isNotEmpty value: T,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(value.isEmpty) {
        return .create(
            message: message() ?? kIsNotEmptyDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}
