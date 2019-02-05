// This file is part of the Loobee package.
//
// (c) Andrey Savitsky <contact@qroc.pro>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// The default message in notifications from `hasSize` assertions for `Collection` types.
@usableFromInline internal let kCollectionSizeDefaultMessage: StaticString = """
Collection has a bad size.
"""

/// Determines if the `collection` has a `requiredSize` count of elements.
@inlinable
public func assert<T: Collection>(
    _ collection: T,
    hasSize requiredSize: Int,
    orNotification message: @autoclosure () -> String? = nil,
    file: StaticString = #file,
    line: UInt = #line
) -> AssertionNotification? {
    if _slowPath(collection.count != requiredSize) {
        return .create(
            message: message() ?? kCollectionSizeDefaultMessage.description,
            file: file,
            line: line
        )
    }

    return nil
}
