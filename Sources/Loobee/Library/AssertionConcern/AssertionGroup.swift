// This file is part of the Loobee package.
//
// (c) Andrey Savitsky <contact@qroc.pro>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// Represents group of assertions for concrete data.
///
/// That allows:
///   - keep the purity of code with a large number of asserts;
///   - aggregate the assertion results using specify strategy.
public struct AssertionGroup {
    /// Delegate for deferred execution of an assertion.
    public typealias LazyYieldFunction = (@autoclosure () -> AssertionNotification?) -> Void

    /// Group notifications container.
    public let notifications: [AssertionNotification]

    ///
    @inlinable
    internal init(_ notifications: [AssertionNotification]) {
        self.notifications = notifications
    }

    /// Aborting directly on the first notification instead collect all notifications.
    ///
    ///     let group = AssertionGroup.lazy("test") { value, yield in
    ///         yield(assert("t", containedIn: value))  // ok
    ///         yield(assert("a", containedIn: value))  // fail
    ///         yield(assert("e", containedIn: value))  // never be executed
    ///         yield(assert("b", containedIn: value))  // never be executed
    ///     }
    ///     print(group.notifications.count) // 1
    ///
    @inlinable
    public static func lazy<T>(
        _ value: T,
        block: (_ value: T, _ yield: LazyYieldFunction) -> Void
    ) -> AssertionGroup {
        var notifications: [AssertionNotification] = []

        block(value) { lazyAssert in
            if _slowPath(!notifications.isEmpty) {
                return
            }

            let assertResult = lazyAssert()
            if _fastPath(assertResult == nil) {
                return
            }

            notifications.append(assertResult!)
        }

        return .init(notifications)
    }
}
