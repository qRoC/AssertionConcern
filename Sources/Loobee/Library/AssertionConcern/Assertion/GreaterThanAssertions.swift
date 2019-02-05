// This file is part of the Loobee package.
//
// (c) Andrey Savitsky <contact@qroc.pro>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// The default message in notifications from `greaterThan` assertions.
@usableFromInline internal let kGreaterThanDefaultMessage: StaticString = """
The value is not greater than boundary value.
"""

/// Determines if the `value` is greater than given limit value.
@inlinable
public func assert<T: Comparable>(
    _ value: T,
    greaterThan boundaryValue: T,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(value <= boundaryValue) {
        return .create(
            message: message() ?? kGreaterThanDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}

/// Determines if the `value` is greater than given limit value.
@inlinable
public func assert<T1: BinaryInteger, T2: BinaryInteger>(
    _ value: T1,
    greaterThan boundaryValue: T2,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(value <= boundaryValue) {
        return .create(
            message: message() ?? kGreaterThanDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}

/// Determines if the `value` is greater than given limit value.
///
/// - Note: This is ambiguity breaker.
@inlinable
public func assert<T: BinaryInteger>(
    _ value: T,
    greaterThan boundaryValue: T,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(value <= boundaryValue) {
        return .create(
            message: message() ?? kGreaterThanDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}
