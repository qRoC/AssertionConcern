// This file is part of the Loobee package.
//
// (c) Andrey Savitsky <contact@qroc.pro>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// The default message in notifications from `isEqualTo` assertions.
@usableFromInline internal let kIsEqualToDefaultMessage: StaticString = """
The values are not equals.
"""

/// The default message in notifications from `isNotEqualTo` assertions.
@usableFromInline internal let kIsNotEqualToDefaultMessage: StaticString = """
The values are equals.
"""

/// Determines if the `value` is equal to another value.
@inlinable
public func assert<T: Equatable>(
    _ value: T,
    isEqualTo value2: T,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(value != value2) {
        return .create(
            message: message() ?? kIsEqualToDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}

/// Determines if the `value` is not equal to another value.
@inlinable
public func assert<T: Equatable>(
    _ value: T,
    isNotEqualTo value2: T,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(value == value2) {
        return .create(
            message: message() ?? kIsNotEqualToDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}
