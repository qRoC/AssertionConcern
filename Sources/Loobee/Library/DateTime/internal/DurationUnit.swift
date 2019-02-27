// This file is part of the Loobee package.
//
// (c) Andrey Savitsky <contact@qroc.pro>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

///
@usableFromInline
internal enum DurationUnit: Int {
    case nanoseconds
    case microseconds
    case milliseconds
    case seconds
    case minutes
    case hours
    case days
    case weeks
    case months
    case years

    /// Accepts the form of the case with which the operation is performed.
    ///
    /// For example:
    ///
    ///     let unit1 = DurationUnit.seconds
    ///     let unit2 = DurationUnit.hours
    ///     let unit3 = DurationUnit.uniform
    ///     print(unit1 == unit3) // true. `unit3` now is `.seconds`.
    ///     print(unit2 == unit3) // true. `unit3` now is `.hours`.
    ///
    case uniform
}

///
extension DurationUnit: Equatable {
    ///
    @usableFromInline
    internal static func == (lhs: DurationUnit, rhs: DurationUnit) -> Bool {
        let lhs = lhs.rawValue
        let rhs = rhs.rawValue
        let uniform = DurationUnit.uniform.rawValue
        return lhs == rhs || lhs == uniform || rhs == uniform
    }
}

///
extension DurationUnit: Comparable {
    ///
    @usableFromInline
    internal static func < (lhs: DurationUnit, rhs: DurationUnit) -> Bool {
        let lhs = lhs.rawValue
        let rhs = rhs.rawValue
        let uniform = DurationUnit.uniform.rawValue

        return lhs < rhs && rhs != uniform
    }

    ///
    @usableFromInline
    internal static func <= (lhs: DurationUnit, rhs: DurationUnit) -> Bool {
        let lhs = lhs.rawValue
        let rhs = rhs.rawValue
        let uniform = DurationUnit.uniform.rawValue

        return lhs <= rhs || lhs == uniform
    }

    ///
    @usableFromInline
    internal static func > (lhs: DurationUnit, rhs: DurationUnit) -> Bool {
        let lhs = lhs.rawValue
        let rhs = rhs.rawValue
        let uniform = DurationUnit.uniform.rawValue

        return lhs > rhs && lhs != uniform
    }

    ///
    @usableFromInline
    internal static func >= (lhs: DurationUnit, rhs: DurationUnit) -> Bool {
        let lhs = lhs.rawValue
        let rhs = rhs.rawValue
        let uniform = DurationUnit.uniform.rawValue

        return lhs >= rhs || rhs == uniform
    }
}
