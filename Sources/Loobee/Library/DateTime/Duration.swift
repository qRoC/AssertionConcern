// This file is part of the Loobee package.
//
// (c) Andrey Savitsky <contact@qroc.pro>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// A duration represents of a span of time, defined as some time unit.
public struct Duration {
    /// Returns value of current time unit.
    public let count: Int64

    /// The ratio of the current unit to nanoseconds.
    @usableFromInline internal let ratio: Int64

    ///
    @usableFromInline
    @inline(__always)
    internal init(count: Int64, ratio: Int64) {
        self.count = count
        self.ratio = ratio
    }

    /// Represents nanoseconds. Is a minimal unit.
    public static func nanoseconds(_ count: Int64) -> Duration {
        return .init(count: count, ratio: 1)
    }

    /// Represents microseconds. 
    ///
    ///     .microseconds(1) == .nanoseconds(1000)
    ///
    public static func microseconds(_ count: Int64) -> Duration {
        return .init(count: count, ratio: 1000)
    }

    /// Represents milliseconds. 
    ///
    ///     .milliseconds(1) == .nanoseconds(1000000)
    ///
    public static func milliseconds(_ count: Int64) -> Duration {
        return .init(count: count, ratio: 1000000)
    }

    /// Represents seconds. 
    ///
    ///     .seconds(1) == .nanoseconds(1000000000)
    ///
    public static func seconds(_ count: Int64) -> Duration {
        return .init(count: count, ratio: 1000000000)
    }

    /// Represents minutes. 
    ///
    ///     .minutes(1) == .seconds(60)
    ///
    public static func minutes(_ count: Int64) -> Duration {
        return .init(count: count, ratio: 60000000000)
    }

    /// Represents hours. 
    ///
    ///     .hours(1) == .seconds(3600)
    ///
    public static func hours(_ count: Int64) -> Duration {
        return .init(count: count, ratio: 3600000000000)
    }

    /// Represents days. 
    ///
    ///     .days(1) == .seconds(86400)
    ///
    public static func days(_ count: Int64) -> Duration {
        return .init(count: count, ratio: 86400000000000)
    }

    /// Represents weeks. 
    ///
    ///     .weeks(1) == .days(7)
    ///
    public static func weeks(_ count: Int64) -> Duration {
        return .init(count: count, ratio: 604800000000000)
    }

    /// Represents months. This value exactly 1/12 of a `Duration.years` (is equal to 30.436875 days).
    ///
    ///     .months(1) == .days(30) + .seconds(37746)
    ///
    public static func months(_ count: Int64) -> Duration {
        return .init(count: count, ratio: 2629746000000000)
    }

    /// Represents years. This value is the average length of a Gregorian year (is equal to 365.2425 days).
    ///
    ///     .years(1) == .days(365) + .seconds(20952)
    ///
    public static func years(_ count: Int64) -> Duration {
        return .init(count: count, ratio: 31556952000000000)
    }
}

public extension Duration {
    /// Casts current time unit to nanoseconds.
    /// Can return `nil` if new value is overflow.
    var nanoseconds: Duration? {
        switch self.ratio {
        case 1:
                return self
        case 1000:
                let (nanoseconds, overflow) = self.count.multipliedReportingOverflow(by: 1000)
                return _slowPath(overflow) ? nil : .nanoseconds(nanoseconds)
        case 1000000:
                let (nanoseconds, overflow) = self.count.multipliedReportingOverflow(by: 1000000)
                return _slowPath(overflow) ? nil : .nanoseconds(nanoseconds)
        case 1000000000:
                let (nanoseconds, overflow) = self.count.multipliedReportingOverflow(by: 1000000000)
                return _slowPath(overflow) ? nil : .nanoseconds(nanoseconds)
        case 60000000000:
                let (nanoseconds, overflow) = self.count.multipliedReportingOverflow(by: 60000000000)
                return _slowPath(overflow) ? nil : .nanoseconds(nanoseconds)
        case 3600000000000:
                let (nanoseconds, overflow) = self.count.multipliedReportingOverflow(by: 3600000000000)
                return _slowPath(overflow) ? nil : .nanoseconds(nanoseconds)
        case 86400000000000:
                let (nanoseconds, overflow) = self.count.multipliedReportingOverflow(by: 86400000000000)
                return _slowPath(overflow) ? nil : .nanoseconds(nanoseconds)
        case 604800000000000:
                let (nanoseconds, overflow) = self.count.multipliedReportingOverflow(by: 604800000000000)
                return _slowPath(overflow) ? nil : .nanoseconds(nanoseconds)
        case 2629746000000000:
                let (nanoseconds, overflow) = self.count.multipliedReportingOverflow(by: 2629746000000000)
                return _slowPath(overflow) ? nil : .nanoseconds(nanoseconds)
        case 31556952000000000:
                let (nanoseconds, overflow) = self.count.multipliedReportingOverflow(by: 31556952000000000)
                return _slowPath(overflow) ? nil : .nanoseconds(nanoseconds)
        default:
            let unreachable = { unsafeBitCast((), to: Never.self) }
            unreachable()
        }
    }

    /// Casts current time unit to microseconds.
    ///
    /// Conversion with precision loss. For example:
    ///
    ///     .nanoseconds(1999).microseconds // .microseconds(1)
    ///
    /// Can return `nil` if new value is overflow.
    var microseconds: Duration? {
        switch self.ratio {
        case 1:
                return .microseconds(self.count / 1000)
        case 1000000:
                let (microseconds, overflow) = self.count.multipliedReportingOverflow(by: 1000)
                return _slowPath(overflow) ? nil : .microseconds(microseconds)
        case 1000000000:
                let (microseconds, overflow) = self.count.multipliedReportingOverflow(by: 1000000)
                return _slowPath(overflow) ? nil : .microseconds(microseconds)
        case 60000000000:
                let (microseconds, overflow) = self.count.multipliedReportingOverflow(by: 60000000)
                return _slowPath(overflow) ? nil : .microseconds(microseconds)
        case 3600000000000:
                let (microseconds, overflow) = self.count.multipliedReportingOverflow(by: 3600000000)
                return _slowPath(overflow) ? nil : .microseconds(microseconds)
        case 86400000000000:
                let (microseconds, overflow) = self.count.multipliedReportingOverflow(by: 86400000000)
                return _slowPath(overflow) ? nil : .microseconds(microseconds)
        case 604800000000000:
                let (microseconds, overflow) = self.count.multipliedReportingOverflow(by: 604800000000)
                return _slowPath(overflow) ? nil : .microseconds(microseconds)
        case 2629746000000000:
                let (microseconds, overflow) = self.count.multipliedReportingOverflow(by: 2629746000000)
                return _slowPath(overflow) ? nil : .microseconds(microseconds)
        case 31556952000000000:
                let (microseconds, overflow) = self.count.multipliedReportingOverflow(by: 31556952000000)
                return _slowPath(overflow) ? nil : .microseconds(microseconds)
        case 1000:
                return self
        default:
            let unreachable = { unsafeBitCast((), to: Never.self) }
            unreachable()
        }
    }

    /// Casts current time unit to milliseconds.
    ///
    /// Conversion with precision loss. For example:
    ///
    ///     .microseconds(1999).milliseconds // .milliseconds(1)
    ///
    /// Can return `nil` if new value is overflow.
    var milliseconds: Duration? {
        switch self.ratio {
        case 1:
                return .milliseconds(self.count / 1000000)
        case 1000:
                return .milliseconds(self.count / 1000)
        case 1000000000:
                let (milliseconds, overflow) = self.count.multipliedReportingOverflow(by: 1000)
                return _slowPath(overflow) ? nil : .milliseconds(milliseconds)
        case 60000000000:
                let (milliseconds, overflow) = self.count.multipliedReportingOverflow(by: 60000)
                return _slowPath(overflow) ? nil : .milliseconds(milliseconds)
        case 3600000000000:
                let (milliseconds, overflow) = self.count.multipliedReportingOverflow(by: 3600000)
                return _slowPath(overflow) ? nil : .milliseconds(milliseconds)
        case 86400000000000:
                let (milliseconds, overflow) = self.count.multipliedReportingOverflow(by: 86400000)
                return _slowPath(overflow) ? nil : .milliseconds(milliseconds)
        case 604800000000000:
                let (milliseconds, overflow) = self.count.multipliedReportingOverflow(by: 604800000)
                return _slowPath(overflow) ? nil : .milliseconds(milliseconds)
        case 2629746000000000:
                let (milliseconds, overflow) = self.count.multipliedReportingOverflow(by: 2629746000)
                return _slowPath(overflow) ? nil : .milliseconds(milliseconds)
        case 31556952000000000:
                let (milliseconds, overflow) = self.count.multipliedReportingOverflow(by: 31556952000)
                return _slowPath(overflow) ? nil : .milliseconds(milliseconds)
        case 1000000:
                return self
        default:
            let unreachable = { unsafeBitCast((), to: Never.self) }
            unreachable()
        }
    }

    /// Casts current time unit to seconds.
    ///
    /// Conversion with precision loss. For example:
    ///
    ///     .milliseconds(1999).seconds // .seconds(1)
    ///
    /// Can return `nil` if new value is overflow.
    var seconds: Duration? {
        switch self.ratio {
        case 1:
                return .seconds(self.count / 1000000000)
        case 1000:
                return .seconds(self.count / 1000000)
        case 1000000:
                return .seconds(self.count / 1000)
        case 60000000000:
                let (seconds, overflow) = self.count.multipliedReportingOverflow(by: 60)
                return _slowPath(overflow) ? nil : .seconds(seconds)
        case 3600000000000:
                let (seconds, overflow) = self.count.multipliedReportingOverflow(by: 3600)
                return _slowPath(overflow) ? nil : .seconds(seconds)
        case 86400000000000:
                let (seconds, overflow) = self.count.multipliedReportingOverflow(by: 86400)
                return _slowPath(overflow) ? nil : .seconds(seconds)
        case 604800000000000:
                let (seconds, overflow) = self.count.multipliedReportingOverflow(by: 604800)
                return _slowPath(overflow) ? nil : .seconds(seconds)
        case 2629746000000000:
                let (seconds, overflow) = self.count.multipliedReportingOverflow(by: 2629746)
                return _slowPath(overflow) ? nil : .seconds(seconds)
        case 31556952000000000:
                let (seconds, overflow) = self.count.multipliedReportingOverflow(by: 31556952)
                return _slowPath(overflow) ? nil : .seconds(seconds)
        case 1000000000:
                return self
        default:
            let unreachable = { unsafeBitCast((), to: Never.self) }
            unreachable()
        }
    }

    /// Casts current time unit to minutes.
    ///
    /// Conversion with precision loss. For example:
    ///
    ///     .seconds(119).minutes // .minutes(1)
    ///
    /// Can return `nil` if new value is overflow.
    var minutes: Duration? {
        switch self.ratio {
        case 1:
                return .minutes(self.count / 60000000000)
        case 1000:
                return .minutes(self.count / 60000000)
        case 1000000:
                return .minutes(self.count / 60000)
        case 1000000000:
                return .minutes(self.count / 60)
        case 3600000000000:
                let (minutes, overflow) = self.count.multipliedReportingOverflow(by: 60)
                return _slowPath(overflow) ? nil : .minutes(minutes)
        case 86400000000000:
                let (minutes, overflow) = self.count.multipliedReportingOverflow(by: 1440)
                return _slowPath(overflow) ? nil : .minutes(minutes)
        case 604800000000000:
                let (minutes, overflow) = self.count.multipliedReportingOverflow(by: 10080)
                return _slowPath(overflow) ? nil : .minutes(minutes)
        case 2629746000000000:
                let count = Double(self.count) * 43829.1
                return _slowPath(count > Double(Int64.max)) ? nil : .minutes(Int64(count))
        case 31556952000000000:
                let count = Double(self.count) * 525949.2
                return _slowPath(count > Double(Int64.max)) ? nil : .minutes(Int64(count))
        case 60000000000:
                return self
        default:
            let unreachable = { unsafeBitCast((), to: Never.self) }
            unreachable()
        }
    }

    /// Casts current time unit to hours.
    ///
    /// Conversion with precision loss. For example:
    ///
    ///     .minutes(119).hours // .hours(1)
    ///
    /// Can return `nil` if new value is overflow.
    var hours: Duration? {
        switch self.ratio {
        case 1:
                return .hours(self.count / 3600000000000)
        case 1000:
                return .hours(self.count / 3600000000)
        case 1000000:
                return .hours(self.count / 3600000)
        case 1000000000:
                return .hours(self.count / 3600)
        case 60000000000:
                return .hours(self.count / 60)
        case 86400000000000:
                let (hours, overflow) = self.count.multipliedReportingOverflow(by: 24)
                return _slowPath(overflow) ? nil : .hours(hours)
        case 604800000000000:
                let (hours, overflow) = self.count.multipliedReportingOverflow(by: 168)
                return _slowPath(overflow) ? nil : .hours(hours)
        case 2629746000000000:
                let count = Double(self.count) * 730.485
                return _slowPath(count > Double(Int64.max)) ? nil : .hours(Int64(count))
        case 31556952000000000:
                let count = Double(self.count) * 8765.82
                return _slowPath(count > Double(Int64.max)) ? nil : .hours(Int64(count))
        case 3600000000000:
                return self
        default:
            let unreachable = { unsafeBitCast((), to: Never.self) }
            unreachable()
        }
    }

    /// Casts current time unit to days.
    ///
    /// Conversion with precision loss. For example:
    ///
    ///     .hours(47).days // .days(1)
    ///
    /// Can return `nil` if new value is overflow.
    var days: Duration? {
        switch self.ratio {
        case 1:
                return .days(self.count / 86400000000000)
        case 1000:
                return .days(self.count / 86400000000)
        case 1000000:
                return .days(self.count / 86400000)
        case 1000000000:
                return .days(self.count / 86400)
        case 60000000000:
                return .days(self.count / 1440)
        case 3600000000000:
                return .days(self.count / 24)
        case 604800000000000:
                let (days, overflow) = self.count.multipliedReportingOverflow(by: 7)
                return _slowPath(overflow) ? nil : .days(days)
        case 2629746000000000:
                let count = Double(self.count) * 30.436875
                return _slowPath(count > Double(Int64.max)) ? nil : .days(Int64(count))
        case 31556952000000000:
                let count = Double(self.count) * 365.2425
                return _slowPath(count > Double(Int64.max)) ? nil : .days(Int64(count))
        case 86400000000000:
                return self
        default:
            let unreachable = { unsafeBitCast((), to: Never.self) }
            unreachable()
        }
    }

    /// Casts current time unit to weeks.
    ///
    /// Conversion with precision loss. For example:
    ///
    ///     .days(13).weeks // .weeks(1)
    ///
    /// Can return `nil` if new value is overflow.
    var weeks: Duration? {
        switch self.ratio {
        case 1:
                return .weeks(self.count / 604800000000000)
        case 1000:
                return .weeks(self.count / 604800000000)
        case 1000000:
                return .weeks(self.count / 604800000)
        case 1000000000:
                return .weeks(self.count / 604800)
        case 60000000000:
                return .weeks(self.count / 10080)
        case 3600000000000:
                return .weeks(self.count / 168)
        case 86400000000000:
                return .weeks(self.count / 7)
        case 604800000000000:
                return self
        case 2629746000000000:
                let count = Double(self.count) * 4.348125
                return _slowPath(count > Double(Int64.max)) ? nil : .weeks(Int64(count))
        case 31556952000000000:
                let count = Double(self.count) * 52.1775
                return _slowPath(count > Double(Int64.max)) ? nil : .weeks(Int64(count))
        default:
            let unreachable = { unsafeBitCast((), to: Never.self) }
            unreachable()
        }
    }

    /// Casts current time unit to months.
    ///
    /// Conversion with precision loss. For example:
    ///
    ///     .weeks(7).months // .months(1)
    ///
    /// Can return `nil` if new value is overflow.
    var months: Duration? {
        switch self.ratio {
        case 1:
                return .months(self.count / 2629746000000000)
        case 1000:
                return .months(self.count / 2629746000000)
        case 1000000:
                return .months(self.count / 2629746000)
        case 1000000000:
                return .months(self.count / 2629746)
        case 31556952000000000:
                let (months, overflow) = self.count.multipliedReportingOverflow(by: 12)
                return _slowPath(overflow) ? nil : .months(months)
        case 2629746000000000:
                return self
        case 60000000000:
                return .months(Int64(Double(self.count) / 43829.1))
        case 3600000000000:
                return .months(Int64(Double(self.count) / 730.485))
        case 86400000000000:
                return .months(Int64(Double(self.count) / 30.436875))
        case 604800000000000:
                return .months(Int64(Double(self.count) / 4.348125))
        default:
            let unreachable = { unsafeBitCast((), to: Never.self) }
            unreachable()
        }
    }

    /// Casts current time unit to years.
    ///
    /// Conversion with precision loss. For example:
    ///
    ///     .months(23).years // .years(1)
    ///
    /// Can return `nil` if new value is overflow.
    var years: Duration? {
        switch self.ratio {
        case 1:
                return .years(self.count / 31556952000000000)
        case 1000:
                return .years(self.count / 31556952000000)
        case 1000000:
                return .years(self.count / 31556952000)
        case 1000000000:
                return .years(self.count / 31556952)
        case 2629746000000000:
                return .years(self.count / 12)
        case 31556952000000000:
                return self
        case 60000000000:
                return .years(Int64(Double(self.count) / 525949.2))
        case 3600000000000:
                return .years(Int64(Double(self.count) / 8765.82))
        case 86400000000000:
                return .years(Int64(Double(self.count) / 365.2425))
        case 604800000000000:
                return .years(Int64(Double(self.count) / 52.1775))
        default:
            let unreachable = { unsafeBitCast((), to: Never.self) }
            unreachable()
        }
    }
}
