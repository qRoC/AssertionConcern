// This file is part of the Loobee package.
//
// (c) Andrey Savitsky <contact@qroc.pro>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// The default message in notifications from `lessOrEqualThan` assertions.
@usableFromInline internal let kLessOrEqualThanDefaultMessage: StaticString = """
The value is not less or equal than max value.
"""

/// Determines if the `value` is less or equal than given limit value.
@inlinable
public func assert<T: Comparable>(
    _ value: T,
    lessOrEqualThan maxValue: T,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(value > maxValue) {
        return .create(
            message: message() ?? kLessOrEqualThanDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}

/// Determines if the `value` is less or equal than given limit value.
@inlinable
public func assert<T1: BinaryInteger, T2: BinaryInteger>(
    _ value: T1,
    lessOrEqualThan maxValue: T2,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(value > maxValue) {
        return .create(
            message: message() ?? kLessOrEqualThanDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}

/// Determines if the `value` is less or equal than given limit value.
///
/// - Note: This is ambiguity breaker.
@inlinable
public func assert<T: BinaryInteger>(
    _ value: T,
    lessOrEqualThan maxValue: T,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(value > maxValue) {
        return .create(
            message: message() ?? kLessOrEqualThanDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}
