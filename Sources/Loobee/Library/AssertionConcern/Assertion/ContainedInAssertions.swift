// This file is part of the Loobee package.
//
// (c) Andrey Savitsky <contact@qroc.pro>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// The default message in notifications from `hasSize` assertions for `Collection` types.
@usableFromInline internal let kSequenceContainedInDefaultMessage: StaticString = """
The value does not contains in the accepted sequence.
"""

/// The default message in notifications from `hasSize` assertions for `Collection` types.
@usableFromInline internal let kSequenceNotContainedInDefaultMessage: StaticString = """
The value contains in the declined sequence.
"""

/// Determines if the `value` is contained in `sequence`.
@inlinable
public func assert<T: Sequence>(
    _ value: T.Element,
    containedIn sequence: T,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? where T.Element: Equatable {
    if _slowPath(!sequence.contains(value)) {
        return .create(
            message: message() ?? kSequenceContainedInDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}

/// Determines if the `value` is not contained in `sequence`.
@inlinable
public func assert<T: Sequence>(
    _ value: T.Element,
    notContainedIn sequence: T,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? where T.Element: Equatable {
    if _slowPath(sequence.contains(value)) {
        return .create(
            message: message() ?? kSequenceNotContainedInDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}
