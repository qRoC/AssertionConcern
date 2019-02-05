// This file is part of the Loobee package.
//
// (c) Andrey Savitsky <contact@qroc.pro>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// The default message in notifications from `between` assertions.
@usableFromInline internal let kBetweenDefaultMessage: StaticString = """
The value is out of range.
"""

/// Mark: (minimum, maximum)

/// Determines if the `value` is between some minimum and maximum.
@inlinable
public func assert<T: Comparable>(
    _ value: T,
    between range: (minimum: T, maximum: T),
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(range.minimum > value || value > range.maximum) {
        return .create(
            message: message() ?? kBetweenDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}

/// Determines if the `value` is between some minimum and maximum.
@inlinable
public func assert<T1: BinaryInteger, T2: BinaryInteger, T3: BinaryInteger>(
    _ value: T1,
    between range: (minimum: T2, maximum: T3),
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(range.minimum > value || value > range.maximum) {
        return .create(
            message: message() ?? kBetweenDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}

/// Determines if the `value` is between some minimum and maximum.
///
/// - Note: This is ambiguity breaker.
@inlinable
public func assert<T: BinaryInteger>(
    _ value: T,
    between range: (minimum: T, maximum: T),
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(range.minimum > value || value > range.maximum) {
        return .create(
            message: message() ?? kBetweenDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}

/// Mark: (lowerBound, upperBound)

/// Determines if the `value` is between some minimum and maximum, but does not equal them.
@inlinable
public func assert<T: Comparable>(
    _ value: T,
    between range: (lowerBound: T, upperBound: T),
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(range.lowerBound >= value || value >= range.upperBound) {
        return .create(
            message: message() ?? kBetweenDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}

/// Determines if the `value` is between some minimum and maximum, but does not equal them.
@inlinable
public func assert<T1: BinaryInteger, T2: BinaryInteger, T3: BinaryInteger>(
    _ value: T1,
    between range: (lowerBound: T2, upperBound: T3),
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(range.lowerBound >= value || value >= range.upperBound) {
        return .create(
            message: message() ?? kBetweenDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}

/// Determines if the `value` is between some minimum and maximum, but does not equal them.
///
/// - Note: This is ambiguity breaker.
@inlinable
public func assert<T: BinaryInteger>(
    _ value: T,
    between range: (lowerBound: T, upperBound: T),
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(range.lowerBound >= value || value >= range.upperBound) {
        return .create(
            message: message() ?? kBetweenDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}

/// Mark: Ranges

/// Determines if the `value` is between some minimum and maximum.
@inlinable
public func assert<T: Comparable>(
    _ value: T,
    between range: ClosedRange<T>,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(!range.contains(value)) {
        return .create(
            message: message() ?? kBetweenDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}

/// Determines if the `value` is between from some minimum up to, but not including, a maximum.
@inlinable
public func assert<T: Comparable>(
    _ value: T,
    between range: Range<T>,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(!range.contains(value)) {
        return .create(
            message: message() ?? kBetweenDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}
