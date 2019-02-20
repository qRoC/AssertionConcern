// This file is part of the Loobee package.
//
// (c) Andrey Savitsky <contact@qroc.pro>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// A duration represents of a span of time, defined as some time unit.
public struct Duration {
    ///
    @usableFromInline let cleanNanoseconds: Int64

    ///
    @usableFromInline let cleanSeconds: Int64

    ///
    @usableFromInline
    @inline(__always)
    internal init(cleanSeconds: Int64, cleanNanoseconds: Int64) {
        self.cleanSeconds = cleanSeconds
        self.cleanNanoseconds = cleanNanoseconds
    }

    /// Represents nanoseconds. Is a minimal unit.
    public static func nanoseconds(_ count: Int64) -> Duration {
        if _fastPath(count < 1000000000) {
            return .init(cleanSeconds: 0, cleanNanoseconds: count)
        }

        let chunks = count.quotientAndRemainder(dividingBy: 1000000000)

        return .init(cleanSeconds: chunks.quotient, cleanNanoseconds: chunks.remainder)
    }

    /// Represents microseconds.
    ///
    ///     .microseconds(1) == .nanoseconds(1000)
    ///
    public static func microseconds(_ count: Int64) -> Duration {
        if _fastPath(count < 1000000) {
            return .init(cleanSeconds: 0, cleanNanoseconds: count * 1000)
        }

        let chunks = count.quotientAndRemainder(dividingBy: 1000000)
        // unsafe
        return .init(cleanSeconds: chunks.quotient, cleanNanoseconds: chunks.remainder * 1000)
    }

    /// Represents milliseconds.
    ///
    ///     .milliseconds(1) == .nanoseconds(1000000)
    ///
    public static func milliseconds(_ count: Int64) -> Duration {
        if _fastPath(count < 1000) {
            return .init(cleanSeconds: 0, cleanNanoseconds: count * 1000000)
        }

        let chunks = count.quotientAndRemainder(dividingBy: 1000)
        // unsafe
        return .init(cleanSeconds: chunks.quotient, cleanNanoseconds: chunks.remainder * 1000000)
    }

    /// Represents seconds.
    ///
    ///     .seconds(1) == .nanoseconds(1000000000)
    ///
    public static func seconds(_ count: Int64) -> Duration {
        return .init(cleanSeconds: count, cleanNanoseconds: 0)
    }

    /// Represents minutes.
    ///
    ///     .minutes(1) == .seconds(60)
    ///
    public static func minutes(_ count: Int64) -> Duration {
        // unsafe
        return .init(cleanSeconds: count * 60, cleanNanoseconds: 0)
    }

    /// Represents hours.
    ///
    ///     .hours(1) == .seconds(3600)
    ///
    public static func hours(_ count: Int64) -> Duration {
        // unsafe
        return .init(cleanSeconds: count * 3600, cleanNanoseconds: 0)
    }

    /// Represents days.
    ///
    ///     .days(1) == .seconds(86400)
    ///
    public static func days(_ count: Int64) -> Duration {
        // unsafe
        return .init(cleanSeconds: count * 86400, cleanNanoseconds: 0)
    }

    /// Represents weeks.
    ///
    ///     .weeks(1) == .days(7)
    ///
    public static func weeks(_ count: Int64) -> Duration {
        // unsafe
        return .init(cleanSeconds: count * 604800, cleanNanoseconds: 0)
    }

    /// Represents months. This value exactly 1/12 of a `Duration.years` (is equal to 30.436875 days).
    ///
    ///     .months(1) == .days(30) + .seconds(37746)
    ///
    public static func months(_ count: Int64) -> Duration {
        // unsafe
        return .init(cleanSeconds: count * 2629746, cleanNanoseconds: 0)
    }

    /// Represents years. This value is the average length of a Gregorian year (is equal to 365.2425 days).
    ///
    ///     .years(1) == .days(365) + .seconds(20952)
    ///
    public static func years(_ count: Int64) -> Duration {
        // unsafe
        return .init(cleanSeconds: count * 31556952, cleanNanoseconds: 0)
    }
}

public extension Duration {
    /// Casts current time unit to nanoseconds.
    /// Can return `nil` if new value is overflow.
    var nanoseconds: Int64? {
        let fromNanoseconds = self.cleanNanoseconds
        if _fastPath(self.cleanSeconds == 0) {
            return fromNanoseconds
        }

        let (fromSeconds, multipliedOverflow) = self.cleanSeconds.multipliedReportingOverflow(by: 1000000000)
        let (fullValue, addingOverflow) = fromNanoseconds.addingReportingOverflow(fromSeconds)

        if _slowPath(multipliedOverflow || addingOverflow) {
            return nil
        }

        return fullValue
    }

    /// Casts current time unit to microseconds.
    /// Can return `nil` if new value is overflow.
    var microseconds: Int64? {
        let fromNanoseconds = self.cleanNanoseconds / 1000
        if _fastPath(self.cleanSeconds == 0) {
            return fromNanoseconds
        }

        let (fromSeconds, multipliedOverflow) = self.cleanSeconds.multipliedReportingOverflow(by: 1000000)
        let (fullValue, addingOverflow) = fromNanoseconds.addingReportingOverflow(fromSeconds)

        if _slowPath(multipliedOverflow || addingOverflow) {
            return nil
        }

        return fullValue
    }

    /// Casts current time unit to milliseconds.
    /// Can return `nil` if new value is overflow.
    var milliseconds: Int64? {
        let fromNanoseconds = self.cleanNanoseconds / 1000000
        if _fastPath(self.cleanSeconds == 0) {
            return fromNanoseconds
        }

        let (fromSeconds, multipliedOverflow) = self.cleanSeconds.multipliedReportingOverflow(by: 1000)
        let (fullValue, addingOverflow) = fromNanoseconds.addingReportingOverflow(fromSeconds)

        if _slowPath(multipliedOverflow || addingOverflow) {
            return nil
        }

        return fullValue
    }

    /// Casts current time unit to seconds.
    var seconds: Int64 {
        return self.cleanSeconds
    }

    /// Casts current time unit to minutes.
    var minutes: Int64 {
        return self.cleanSeconds / 60
    }

    /// Casts current time unit to hours.
    var hours: Int64 {
        return self.cleanSeconds / 3600
    }

    /// Casts current time unit to days.
    var days: Int64 {
        return self.cleanSeconds / 86400
    }

    /// Casts current time unit to weeks.
    var weeks: Int64 {
        return self.cleanSeconds / 604800
    }

    /// Casts current time unit to months.
    var months: Int64 {
        return self.cleanSeconds / 2629746
    }

    /// Casts current time unit to years.
    var years: Int64 {
        return self.cleanSeconds / 31556952
    }
}
