// This file is part of the Loobee package.
//
// (c) Andrey Savitsky <contact@qroc.pro>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// The default message in notifications from `isBlank` assertions.
@usableFromInline internal let kIsBlankDefaultMessage: StaticString = """
The value contain a value.
"""

/// The default message in notifications from `isNotBlank` assertions.
@usableFromInline internal let kIsNotBlankDefaultMessage: StaticString = """
The value does not contain a value.
"""

/// Determines if the `value` is blank (value == 0).
@inlinable
public func assert<T: BinaryInteger>(
    isBlank value: T,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(value != 0) {
        return .create(
            message: message() ?? kIsBlankDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}

/// Determines if the `value` is not blank (value != 0).
@inlinable
public func assert<T: BinaryInteger>(
    isNotBlank value: T,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(value == 0) {
        return .create(
            message: message() ?? kIsNotBlankDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}

/// Determines if the `value` is blank (value == 0.0).
@inlinable
public func assert<T: BinaryFloatingPoint>(
    isBlank value: T,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(value != 0.0) {
        return .create(
            message: message() ?? kIsBlankDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}

/// Determines if the `value` is not blank (value != 0.0).
@inlinable
public func assert<T: BinaryFloatingPoint>(
    isNotBlank value: T,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(value == 0) {
        return .create(
            message: message() ?? kIsNotBlankDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}

/// Determines if the `string` is blank (string.isEmpty || each char is whitespace or newline).
///
/// - SeeAlso: `Character.isWhitespace`
/// - SeeAlso: `Character.isNewline`
@inlinable
public func assert<T: StringProtocol>(
    isBlank string: T,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    let notEmptySymbol = string.first {
        _slowPath(!($0.isWhitespace || $0.isNewline))
    }

    if _slowPath(notEmptySymbol != nil) {
        return .create(
            message: message() ?? kIsBlankDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}

/// Determines if the `string` is not blank (!string.isEmpty && has not whitespace or newline char).
///
/// - SeeAlso: `Character.isWhitespace`
/// - SeeAlso: `Character.isNewline`
@inlinable
public func assert<T: StringProtocol>(
    isNotBlank string: T,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    let notEmptySymbol = string.first {
        _fastPath(!($0.isWhitespace || $0.isNewline))
    }

    if _slowPath(string.isEmpty || notEmptySymbol == nil) {
        return .create(
            message: message() ?? kIsNotBlankDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}
