// This file is part of the Loobee package.
//
// (c) Andrey Savitsky <contact@qroc.pro>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// Satisfaction errors from the `AssertionConcern` methods.
public enum AssertionConcernError: Error, Equatable, CustomStringConvertible, CustomDebugStringConvertible {
    /// Contains notifications from not satisfied asserts.
    case notSatisfied(notifications: [AssertionNotification])

    /// Returns base info about error.
    ///
    /// For `notSatisfied` cases return count of not satisfied asserts.
    public var description: String {
        switch self {
        case .notSatisfied(let notifications):
            return "Validity check returned \(notifications.count) errors."
        }
    }

    /// Returns detailed info about error.
    ///
    /// Returns string is content of `description` property with additional
    /// information from not satisfied asserts.
    public var debugDescription: String {
        switch self {
        case .notSatisfied(let notifications):
            let errorList = notifications.map { $0.description }.joined(separator: "\n")
            return "Validity check returned \(notifications.count) errors: \n \(errorList)"
        }
    }
}

/// Collection of methods for working with assertions.
public enum AssertionConcern {
    /// Accepts assertion results and throws error if at least one assert is not satisfied.
    ///
    ///   try AssertionConcern.satisfy(
    ///       assert(10, greaterOrEqualThan: 4),
    ///       assert(5, between: 0..<10, orNotification: "Message")
    ///   )
    ///
    /// - Throws: `AssertionConcernError`
    public static func satisfy(_ assertResults: AssertionNotification?...) throws {
        let notifications = assertResults.compactMap { $0 }

        if _slowPath(!notifications.isEmpty) {
            throw AssertionConcernError.notSatisfied(notifications: notifications)
        }
    }

    /// Accepts assertion groups results and throws error if at least one group is not satisfied.
    ///
    /// For more details, see `AssertionGroup`.
    ///
    ///     do {
    ///         try AssertionConcern.groupsSatisfy(
    ///             .lazy("test") { value, yield in
    ///                 yield(assert("t", containedIn: value))  // ok
    ///                 yield(assert("a", containedIn: value))  // fail
    ///                 yield(assert("e", containedIn: value))  // never be executed
    ///                 yield(assert("b", containedIn: value))  // never be executed
    ///             },
    ///             .all("test") { value, yield in
    ///                 yield(assert("t", containedIn: value))  // ok
    ///                 yield(assert("a", containedIn: value))  // fail
    ///                 yield(assert("e", containedIn: value))  // ok
    ///                 yield(assert("b", containedIn: value))  // fail
    ///             },
    ///         )
    ///     } catch AssertionConcernError.notSatisfied(let notifications) {
    ///         /// Print notifications result of:
    ///         ///   assert("a", containedIn: value) // from .lazy("test")
    ///         ///   assert("a", containedIn: value) // from .all("test")
    ///         ///   assert("b", containedIn: value) // from .all("test")
    ///         print(notifications)
    ///     } catch {
    ///         print(error) // never be executed
    ///     }
    /// - Throws: `AssertionConcernError`
    public static func groupsSatisfy(_ groups: AssertionGroup...) throws {
        let countOfNotifications = groups.reduce(0) { currentCount, group in
            currentCount + group.notifications.count
        }

        if _slowPath(countOfNotifications > 0) {
            var notifications: [AssertionNotification] = []
            notifications.reserveCapacity(countOfNotifications)
            groups.forEach {
                notifications.append(contentsOf: $0.notifications)
            }

            throw AssertionConcernError.notSatisfied(notifications: notifications)
        }
    }
}
