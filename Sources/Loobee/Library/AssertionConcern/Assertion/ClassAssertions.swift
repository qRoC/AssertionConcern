// This file is part of the Loobee package.
//
// (c) Andrey Savitsky <contact@qroc.pro>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// The default message in notifications from `isSameInstanceAs` assertions.
@usableFromInline internal let kIsSameInstanceAsDefaultMessage: StaticString = """
The objects are not the same instances.
"""

/// The default message in notifications from `isNotSameInstanceAs` assertions.
@usableFromInline internal let kIsNotSameInstanceAsDefaultMessage: StaticString = """
The objects are the same instances.
"""

/// Determines if the `object` instance is same as the given instance.
@inlinable
public func assert<T: AnyObject>(
    _ object: T,
    isSameInstanceAs object2: T,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(object !== object2) {
        return .create(
            message: message() ?? kIsSameInstanceAsDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}

/// Determines if the `object` instance is not same as the given instance.
@inlinable
public func assert<T: AnyObject>(
    _ object: T,
    isNotSameInstanceAs object2: T,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(object === object2) {
        return .create(
            message: message() ?? kIsNotSameInstanceAsDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}
