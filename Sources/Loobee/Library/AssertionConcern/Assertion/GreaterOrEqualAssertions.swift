// This file is part of the Loobee package.
//
// (c) Andrey Savitsky <contact@qroc.pro>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// The default message in notifications from `greaterOrEqualThan` assertions.
@usableFromInline internal let kGreaterOrEqualThanDefaultMessage: StaticString = """
The value is not greater or equal than min value.
"""

/// Determines if the `value` is greater or equal than given limit value.
@inlinable
public func assert<T: Comparable>(
    _ value: T,
    greaterOrEqualThan minValue: T,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(value < minValue) {
        return .create(
            message: message() ?? kGreaterOrEqualThanDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}

/// Determines if the `value` is greater or equal than given limit value.
@inlinable
public func assert<T1: BinaryInteger, T2: BinaryInteger>(
    _ value: T1,
    greaterOrEqualThan minValue: T2,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(value < minValue) {
        return .create(
            message: message() ?? kGreaterOrEqualThanDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}

/// Determines if the `value` is greater or equal than given limit value.
///
/// - Note: This is ambiguity breaker.
@inlinable
public func assert<T: BinaryInteger>(
    _ value: T,
    greaterOrEqualThan minValue: T,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(value < minValue) {
        return .create(
            message: message() ?? kGreaterOrEqualThanDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}
