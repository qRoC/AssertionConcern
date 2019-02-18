// This file is part of the Loobee package.
//
// (c) Andrey Savitsky <contact@qroc.pro>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// The default message in notifications from `startsWith` assertions.
@usableFromInline internal let kStartsWithDefaultMessage: StaticString = """
The value does not start with required string.
"""

/// The default message in notifications from `endsWith` assertions.
@usableFromInline internal let kEndsWithDefaultMessage: StaticString = """
The value does not end with required string.
"""

/// Determines if the `string` start with required string.
@inlinable
public func assert<T1: StringProtocol, T2: StringProtocol>(
    _ string: T1,
    startsWith requredString: T2,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(!string.hasPrefix(requredString)) {
        return .create(
            message: message() ?? kStartsWithDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}

/// Determines if the `string` end with required string.
@inlinable
public func assert<T1: StringProtocol, T2: StringProtocol>(
    _ string: T1,
    endsWith requredString: T2,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(!string.hasSuffix(requredString)) {
        return .create(
            message: message() ?? kEndsWithDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}
