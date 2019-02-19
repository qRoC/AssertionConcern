// This file is part of the Loobee package.
//
// (c) Andrey Savitsky <contact@qroc.pro>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// A duration represents of a span of time, defined as some time unit.
public enum Duration {
    /// Represents nanoseconds. Is a minimal unit.
    case nanoseconds(Int64)

    /// Represents microseconds. 
    ///
    ///     .microseconds(1) == .nanoseconds(1000)
    ///
    case microseconds(Int64)

    /// Represents milliseconds. 
    ///
    ///     .milliseconds(1) == .nanoseconds(1000000)
    ///
    case milliseconds(Int64)

    /// Represents seconds. 
    ///
    ///     .seconds(1) == .nanoseconds(1000000000)
    ///
    case seconds(Int64)

    /// Represents minutes. 
    ///
    ///     .minutes(1) == .seconds(60)
    ///
    case minutes(Int64)

    /// Represents hours. 
    ///
    ///     .hours(1) == .seconds(3600)
    ///
    case hours(Int64)

    /// Represents days. 
    ///
    ///     .days(1) == .seconds(86400)
    ///
    case days(Int64)

    /// Represents weeks. 
    ///
    ///     .weeks(1) == .days(7)
    ///
    case weeks(Int64)

    /// Represents months. This value exactly 1/12 of a `Duration.years` (is equal to 30.436875 days).
    ///
    ///     .months(1) == .days(30) + .seconds(37746)
    ///
    case months(Int64)

    /// Represents years. This value is the average length of a Gregorian year (is equal to 365.2425 days).
    ///
    ///     .years(1) == .days(365) + .seconds(20952)
    ///
    case years(Int64)

    /// Returns value of current time unit.
    public var count: Int64 {
        switch self {
        case .nanoseconds(let count),
             .microseconds(let count),
             .milliseconds(let count),
             .seconds(let count),
             .minutes(let count),
             .hours(let count),
             .days(let count),
             .weeks(let count),
             .months(let count),
             .years(let count):
            return count
        }
    }
}

public extension Duration {
    /// Casts current time unit to nanoseconds.
    /// Can return `nil` if new value is overflow.
    var nanoseconds: Duration? {
        switch self {
        case .nanoseconds:
            return self
        case .microseconds:
            let (nanoseconds, overflow) = self.count.multipliedReportingOverflow(by: 1000)
            return _slowPath(overflow) ? nil : .nanoseconds(nanoseconds)
        case .milliseconds:
            let (nanoseconds, overflow) = self.count.multipliedReportingOverflow(by: 1000000)
            return _slowPath(overflow) ? nil : .nanoseconds(nanoseconds)
        case .seconds:
            let (nanoseconds, overflow) = self.count.multipliedReportingOverflow(by: 1000000000)
            return _slowPath(overflow) ? nil : .nanoseconds(nanoseconds)
        case .minutes:
            let (nanoseconds, overflow) = self.count.multipliedReportingOverflow(by: 60000000000)
            return _slowPath(overflow) ? nil : .nanoseconds(nanoseconds)
        case .hours:
            let (nanoseconds, overflow) = self.count.multipliedReportingOverflow(by: 3600000000000)
            return _slowPath(overflow) ? nil : .nanoseconds(nanoseconds)
        case .days:
            let (nanoseconds, overflow) = self.count.multipliedReportingOverflow(by: 86400000000000)
            return _slowPath(overflow) ? nil : .nanoseconds(nanoseconds)
        case .weeks:
            let (nanoseconds, overflow) = self.count.multipliedReportingOverflow(by: 604800000000000)
            return _slowPath(overflow) ? nil : .nanoseconds(nanoseconds)
        case .months:
            let (nanoseconds, overflow) = self.count.multipliedReportingOverflow(by: 2629746000000000)
            return _slowPath(overflow) ? nil : .nanoseconds(nanoseconds)
        case .years:
            let (nanoseconds, overflow) = self.count.multipliedReportingOverflow(by: 31556952000000000)
            return _slowPath(overflow) ? nil : .nanoseconds(nanoseconds)
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
        switch self {
        case .nanoseconds(let count):
            return .microseconds(count / 1000)
        case .microseconds:
            return self
        case .milliseconds:
            let (microseconds, overflow) = self.count.multipliedReportingOverflow(by: 1000)
            return _slowPath(overflow) ? nil : .microseconds(microseconds)
        case .seconds:
            let (microseconds, overflow) = self.count.multipliedReportingOverflow(by: 1000000)
            return _slowPath(overflow) ? nil : .microseconds(microseconds)
        case .minutes:
            let (microseconds, overflow) = self.count.multipliedReportingOverflow(by: 60000000)
            return _slowPath(overflow) ? nil : .microseconds(microseconds)
        case .hours:
            let (microseconds, overflow) = self.count.multipliedReportingOverflow(by: 3600000000)
            return _slowPath(overflow) ? nil : .microseconds(microseconds)
        case .days:
            let (microseconds, overflow) = self.count.multipliedReportingOverflow(by: 86400000000)
            return _slowPath(overflow) ? nil : .microseconds(microseconds)
        case .weeks:
            let (microseconds, overflow) = self.count.multipliedReportingOverflow(by: 604800000000)
            return _slowPath(overflow) ? nil : .microseconds(microseconds)
        case .months:
            let (microseconds, overflow) = self.count.multipliedReportingOverflow(by: 2629746000000)
            return _slowPath(overflow) ? nil : .microseconds(microseconds)
        case .years:
            let (microseconds, overflow) = self.count.multipliedReportingOverflow(by: 31556952000000)
            return _slowPath(overflow) ? nil : .microseconds(microseconds)
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
        switch self {
        case .nanoseconds(let count):
            return .milliseconds(count / 1000000)
        case .microseconds(let count):
            return .milliseconds(count / 1000)
        case .milliseconds:
            return self
        case .seconds:
            let (milliseconds, overflow) = self.count.multipliedReportingOverflow(by: 1000)
            return _slowPath(overflow) ? nil : .milliseconds(milliseconds)
        case .minutes:
            let (milliseconds, overflow) = self.count.multipliedReportingOverflow(by: 60000)
            return _slowPath(overflow) ? nil : .milliseconds(milliseconds)
        case .hours:
            let (milliseconds, overflow) = self.count.multipliedReportingOverflow(by: 3600000)
            return _slowPath(overflow) ? nil : .milliseconds(milliseconds)
        case .days:
            let (milliseconds, overflow) = self.count.multipliedReportingOverflow(by: 86400000)
            return _slowPath(overflow) ? nil : .milliseconds(milliseconds)
        case .weeks:
            let (milliseconds, overflow) = self.count.multipliedReportingOverflow(by: 604800000)
            return _slowPath(overflow) ? nil : .milliseconds(milliseconds)
        case .months:
            let (milliseconds, overflow) = self.count.multipliedReportingOverflow(by: 2629746000)
            return _slowPath(overflow) ? nil : .milliseconds(milliseconds)
        case .years:
            let (milliseconds, overflow) = self.count.multipliedReportingOverflow(by: 31556952000)
            return _slowPath(overflow) ? nil : .milliseconds(milliseconds)
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
        switch self {
        case .nanoseconds(let count):
            return .seconds(count / 1000000000)
        case .microseconds(let count):
            return .seconds(count / 1000000)
        case .milliseconds(let count):
            return .seconds(count / 1000)
        case .seconds:
            return self
        case .minutes:
            let (seconds, overflow) = self.count.multipliedReportingOverflow(by: 60)
            return _slowPath(overflow) ? nil : .seconds(seconds)
        case .hours:
            let (seconds, overflow) = self.count.multipliedReportingOverflow(by: 3600)
            return _slowPath(overflow) ? nil : .seconds(seconds)
        case .days:
            let (seconds, overflow) = self.count.multipliedReportingOverflow(by: 86400)
            return _slowPath(overflow) ? nil : .seconds(seconds)
        case .weeks:
            let (seconds, overflow) = self.count.multipliedReportingOverflow(by: 604800)
            return _slowPath(overflow) ? nil : .seconds(seconds)
        case .months:
            let (seconds, overflow) = self.count.multipliedReportingOverflow(by: 2629746)
            return _slowPath(overflow) ? nil : .seconds(seconds)
        case .years:
            let (seconds, overflow) = self.count.multipliedReportingOverflow(by: 31556952)
            return _slowPath(overflow) ? nil : .seconds(seconds)
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
        switch self {
        case .nanoseconds(let count):
            return .minutes(count / 60000000000)
        case .microseconds(let count):
            return .minutes(count / 60000000)
        case .milliseconds(let count):
            return .minutes(count / 60000)
        case .seconds(let count):
            return .minutes(count / 60)
        case .minutes:
            return self
        case .hours:
            let (minutes, overflow) = self.count.multipliedReportingOverflow(by: 60)
            return _slowPath(overflow) ? nil : .minutes(minutes)
        case .days:
            let (minutes, overflow) = self.count.multipliedReportingOverflow(by: 1440)
            return _slowPath(overflow) ? nil : .minutes(minutes)
        case .weeks:
            let (minutes, overflow) = self.count.multipliedReportingOverflow(by: 10080)
            return _slowPath(overflow) ? nil : .minutes(minutes)
        case .months:
                let count = Double(self.count) * 43829.1
                return _slowPath(count > Double(Int64.max)) ? nil : .minutes(Int64(count))
        case .years:
                let count = Double(self.count) * 525949.2
                return _slowPath(count > Double(Int64.max)) ? nil : .minutes(Int64(count))
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
        switch self {
        case .nanoseconds(let count):
            return .hours(count / 3600000000000)
        case .microseconds(let count):
            return .hours(count / 3600000000)
        case .milliseconds(let count):
            return .hours(count / 3600000)
        case .seconds(let count):
            return .hours(count / 3600)
        case .minutes(let count):
            return .hours(count / 60)
        case .hours:
            return self
        case .days:
            let (hours, overflow) = self.count.multipliedReportingOverflow(by: 24)
            return _slowPath(overflow) ? nil : .hours(hours)
        case .weeks:
            let (hours, overflow) = self.count.multipliedReportingOverflow(by: 168)
            return _slowPath(overflow) ? nil : .hours(hours)
        case .months:
                let count = Double(self.count) * 730.485
                return _slowPath(count > Double(Int64.max)) ? nil : .hours(Int64(count))
        case .years:
                let count = Double(self.count) * 8765.82
                return _slowPath(count > Double(Int64.max)) ? nil : .hours(Int64(count))
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
        switch self {
        case .nanoseconds(let count):
            return .days(count / 86400000000000)
        case .microseconds(let count):
            return .days(count / 86400000000)
        case .milliseconds(let count):
            return .days(count / 86400000)
        case .seconds(let count):
            return .days(count / 86400)
        case .minutes(let count):
            return .days(count / 1440)
        case .hours(let count):
            return .days(count / 24)
        case .days:
            return self
        case .weeks:
            let (days, overflow) = self.count.multipliedReportingOverflow(by: 7)
            return _slowPath(overflow) ? nil : .days(days)
        case .months:
                let count = Double(self.count) * 30.436875
                return _slowPath(count > Double(Int64.max)) ? nil : .days(Int64(count))
        case .years:
                let count = Double(self.count) * 365.2425
                return _slowPath(count > Double(Int64.max)) ? nil : .days(Int64(count))
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
        switch self {
        case .nanoseconds(let count):
            return .weeks(count / 604800000000000)
        case .microseconds(let count):
            return .weeks(count / 604800000000)
        case .milliseconds(let count):
            return .weeks(count / 604800000)
        case .seconds(let count):
            return .weeks(count / 604800)
        case .minutes(let count):
            return .weeks(count / 10080)
        case .hours(let count):
            return .weeks(count / 168)
        case .days(let count):
            return .weeks(count / 7)
        case .weeks:
            return self
        case .months:
                let count = Double(self.count) * 4.348125
                return _slowPath(count > Double(Int64.max)) ? nil : .weeks(Int64(count))
        case .years:
                let count = Double(self.count) * 52.1775
                return _slowPath(count > Double(Int64.max)) ? nil : .weeks(Int64(count))
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
        switch self {
        case .nanoseconds(let count):
            return .months(count / 2629746000000000)
        case .microseconds(let count):
            return .months(count / 2629746000000)
        case .milliseconds(let count):
            return .months(count / 2629746000)
        case .seconds(let count):
            return .months(count / 2629746)
        case .minutes(let count):
            return .months(Int64(Double(count) / 43829.1))
        case .hours(let count):
            return .months(Int64(Double(count) / 730.485))
        case .days(let count):
            return .months(Int64(Double(count) / 30.436875))
        case .weeks(let count):
            return .months(Int64(Double(count) / 4.348125))
        case .months:
            return self
        case .years:
            let (months, overflow) = self.count.multipliedReportingOverflow(by: 12)
            return _slowPath(overflow) ? nil : .months(months)
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
        switch self {
        case .nanoseconds(let count):
            return .years(count / 31556952000000000)
        case .microseconds(let count):
            return .years(count / 31556952000000)
        case .milliseconds(let count):
            return .years(count / 31556952000)
        case .seconds(let count):
            return .years(count / 31556952)
        case .minutes(let count):
            return .years(Int64(Double(count) / 525949.2))
        case .hours(let count):
            return .years(Int64(Double(count) / 8765.82))
        case .days(let count):
            return .years(Int64(Double(count) / 365.2425))
        case .weeks(let count):
            return .years(Int64(Double(count) / 52.1775))
        case .months(let count):
            return .years(count / 12)
        case .years:
            return self
        }
    }
}
