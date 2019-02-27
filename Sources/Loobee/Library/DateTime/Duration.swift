// This file is part of the Loobee package.
//
// (c) Andrey Savitsky <contact@qroc.pro>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// A duration represents of a span of time, defined as some time unit.
public struct Duration: ExpressibleByIntegerLiteral {
    /// Returns value of current time unit.
    public let count: Int64

    /// Duration unit.
    ///
    /// - Note: For optimizes, this property must be declared last.
    @usableFromInline internal let unit: DurationUnit

    ///
    @usableFromInline
    @inline(__always)
    internal init(count: Int64, unit: DurationUnit) {
        self.count = count
        self.unit = unit
    }

    /// Creates an instance initialized to the specified integer value.
    ///
    /// The created instance has uniform time unit. This means that it
    /// takes the form of a unit with which an operation is performed.
    ///
    /// For example:
    ///
    ///     let base: Duration = 100
    ///     print(base == .microseconds(100)) // true
    ///     print(base == .milliseconds(100)) // true
    ///
    /// Another example demonstrates working with arithmetic operations:
    ///
    ///     let base: Duration = 100
    ///     let duration1 = base + .microseconds(30) // 130 microseconds
    ///     let duration2 = base + .milliseconds(50) // 150 milliseconds
    ///
    /// - Note: Do not call this initializer directly.
    @inlinable
    public init(integerLiteral count: Int64) {
        self = .init(count: count, unit: .uniform)
    }

    /// Creates the `Duration` instance in uniform time unit with `count` equal to zero.
    @inlinable
    public init() {
        self = .init(count: 0, unit: .uniform)
    }

    /// The maximum representable duration.
    @inlinable static public var max: Duration {
        return .init(count: Int64.max, unit: .uniform)
    }

    /// The minimum representable duration.
    @inlinable static public var min: Duration {
        return .init(count: Int64.min, unit: .uniform)
    }

    /// Represents nanoseconds. Is a minimal unit.
    @inlinable
    public static func nanoseconds(_ count: Int64) -> Duration {
        return .init(count: count, unit: .nanoseconds)
    }

    /// Represents microseconds.
    ///
    ///     .microseconds(1) == .nanoseconds(1000)
    ///
    @inlinable
    public static func microseconds(_ count: Int64) -> Duration {
        return .init(count: count, unit: .microseconds)
    }

    /// Represents milliseconds.
    ///
    ///     .milliseconds(1) == .nanoseconds(1_000_000)
    ///
    @inlinable
    public static func milliseconds(_ count: Int64) -> Duration {
        return .init(count: count, unit: .milliseconds)
    }

    /// Represents seconds.
    ///
    ///     .seconds(1) == .nanoseconds(1_000_000_000)
    ///
    @inlinable
    public static func seconds(_ count: Int64) -> Duration {
        return .init(count: count, unit: .seconds)
    }

    /// Represents minutes.
    ///
    ///     .minutes(1) == .seconds(60)
    ///
    @inlinable
    public static func minutes(_ count: Int64) -> Duration {
        return .init(count: count, unit: .minutes)
    }

    /// Represents hours.
    ///
    ///     .hours(1) == .seconds(3600)
    ///
    @inlinable
    public static func hours(_ count: Int64) -> Duration {
        return .init(count: count, unit: .hours)
    }

    /// Represents days.
    ///
    ///     .days(1) == .seconds(86400)
    ///
    @inlinable
    public static func days(_ count: Int64) -> Duration {
        return .init(count: count, unit: .days)
    }

    /// Represents weeks.
    ///
    ///     .weeks(1) == .days(7)
    ///
    @inlinable
    public static func weeks(_ count: Int64) -> Duration {
        return .init(count: count, unit: .weeks)
    }

    /// Represents months.
    ///
    /// This `count` exactly 1/12 of a `Duration.years` (is equal to 30.436875 days).
    ///
    ///     .months(1) == .days(30) + .seconds(37746)
    ///
    @inlinable
    public static func months(_ count: Int64) -> Duration {
        return .init(count: count, unit: .months)
    }

    /// Represents years.
    ///
    /// This `count` is the average length of a Gregorian year (is equal to 365.2425 days).
    ///
    ///     .years(1) == .days(365) + .seconds(20952)
    ///
    @inlinable
    public static func years(_ count: Int64) -> Duration {
        return .init(count: count, unit: .years)
    }
}

///
extension Duration {
    /// Casts current time unit to nanoseconds.
    ///
    /// Can return `nil` if new duration is overflow.
    @inlinable public var nanoseconds: Duration? {
        let scaleMap: [Int64] = [
            1,
            1000,
            1000000,
            1000000000,
            60000000000,
            3600000000000,
            86400000000000,
            604800000000000,
            2629746000000000,
            31556952000000000,
            1,
        ]

        let scale = scaleMap[self.unit.rawValue]

        let (nanoseconds, overflow) = self.count.multipliedReportingOverflow(by: scale)
        return _slowPath(overflow) ? nil : .nanoseconds(nanoseconds)
    }

    /// Casts current time unit to microseconds.
    ///
    /// Conversion with precision loss. For example:
    ///
    ///     .nanoseconds(1999).microseconds // .microseconds(1)
    ///
    /// Can return `nil` if new duration is overflow.
    @inlinable public var microseconds: Duration? {
        switch self.unit {
        case .nanoseconds:
            return .microseconds(self.count / 1000)
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
        case .uniform:
            return .microseconds(self.count)
        }
    }

    /// Casts current time unit to milliseconds.
    ///
    /// Conversion with precision loss. For example:
    ///
    ///     .microseconds(1999).milliseconds // .milliseconds(1)
    ///
    /// Can return `nil` if new duration is overflow.
    @inlinable public var milliseconds: Duration? {
        switch self.unit {
        case .nanoseconds:
            return .milliseconds(self.count / 1000000)
        case .microseconds:
            return .milliseconds(self.count / 1000)
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
        case .uniform:
            return .milliseconds(self.count)
        }
    }

    /// Casts current time unit to seconds.
    ///
    /// Conversion with precision loss. For example:
    ///
    ///     .milliseconds(1999).seconds // .seconds(1)
    ///
    /// Can return `nil` if new duration is overflow.
    @inlinable public var seconds: Duration? {
        switch self.unit {
        case .nanoseconds:
            return .seconds(self.count / 1000000000)
        case .microseconds:
            return .seconds(self.count / 1000000)
        case .milliseconds:
            return .seconds(self.count / 1000)
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
        case .uniform:
            return .seconds(self.count)
        }
    }

    /// Casts current time unit to minutes.
    ///
    /// Conversion with precision loss. For example:
    ///
    ///     .seconds(119).minutes // .minutes(1)
    ///
    /// Can return `nil` if new duration is overflow.
    @inlinable public var minutes: Duration? {
        switch self.unit {
        case .nanoseconds:
            return .minutes(divisionBy60000000000(self.count))
        case .microseconds:
            return .minutes(self.count / 60000000)
        case .milliseconds:
            return .minutes(self.count / 60000)
        case .seconds:
            return .minutes(self.count / 60)
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
            let minutes = Double(self.count) * 43829.1
            return _slowPath(minutes > Double(Int64.max)) ? nil : .minutes(Int64(minutes))
        case .years:
            let minutes = Double(self.count) * 525949.2
            return _slowPath(minutes > Double(Int64.max)) ? nil : .minutes(Int64(minutes))
        case .uniform:
            return .minutes(self.count)
        }
    }

    /// Casts current time unit to hours.
    ///
    /// Conversion with precision loss. For example:
    ///
    ///     .minutes(119).hours // .hours(1)
    ///
    /// Can return `nil` if new duration is overflow.
    @inlinable public var hours: Duration? {
        switch self.unit {
        case .nanoseconds:
            return .hours(divisionBy3600000000000(self.count))
        case .microseconds:
            return .hours(divisionBy3600000000(self.count))
        case .milliseconds:
            return .hours(self.count / 3600000)
        case .seconds:
            return .hours(self.count / 3600)
        case .minutes:
            return .hours(self.count / 60)
        case .hours:
            return self
        case .days:
            let (hours, overflow) = self.count.multipliedReportingOverflow(by: 24)
            return _slowPath(overflow) ? nil : .hours(hours)
        case .weeks:
            let (hours, overflow) = self.count.multipliedReportingOverflow(by: 168)
            return _slowPath(overflow) ? nil : .hours(hours)
        case .months:
            let hours = Double(self.count) * 730.485
            return _slowPath(hours > Double(Int64.max)) ? nil : .hours(Int64(hours))
        case .years:
            let hours = Double(self.count) * 8765.82
            return _slowPath(hours > Double(Int64.max)) ? nil : .hours(Int64(hours))
        case .uniform:
            return .hours(self.count)
        }
    }

    /// Casts current time unit to days.
    ///
    /// Conversion with precision loss. For example:
    ///
    ///     .hours(47).days // .days(1)
    ///
    /// Can return `nil` if new duration is overflow.
    @inlinable public var days: Duration? {
        switch self.unit {
        case .nanoseconds:
            return .days(divisionBy86400000000000(self.count))
        case .microseconds:
            return .days(divisionBy86400000000(self.count))
        case .milliseconds:
            return .days(self.count / 86400000)
        case .seconds:
            return .days(self.count / 86400)
        case .minutes:
            return .days(self.count / 1440)
        case .hours:
            return .days(self.count / 24)
        case .days:
            return self
        case .weeks:
            let (days, overflow) = self.count.multipliedReportingOverflow(by: 7)
            return _slowPath(overflow) ? nil : .days(days)
        case .months:
            let days = Double(self.count) * 30.436875
            return _slowPath(days > Double(Int64.max)) ? nil : .days(Int64(days))
        case .years:
            let days = Double(self.count) * 365.2425
            return _slowPath(days > Double(Int64.max)) ? nil : .days(Int64(days))
        case .uniform:
            return .days(self.count)
        }
    }

    /// Casts current time unit to weeks.
    ///
    /// Conversion with precision loss. For example:
    ///
    ///     .days(13).weeks // .weeks(1)
    ///
    /// Can return `nil` if new duration is overflow.
    @inlinable public var weeks: Duration? {
        switch self.unit {
        case .nanoseconds:
            return .weeks(divisionBy604800000000000(self.count))
        case .microseconds:
            return .weeks(divisionBy604800000000(self.count))
        case .milliseconds:
            return .weeks(self.count / 604800000)
        case .seconds:
            return .weeks(self.count / 604800)
        case .minutes:
            return .weeks(self.count / 10080)
        case .hours:
            return .weeks(self.count / 168)
        case .days:
            return .weeks(self.count / 7)
        case .weeks:
            return self
        case .months:
            let weeks = Double(self.count) * 4.348125
            return _slowPath(weeks > Double(Int64.max)) ? nil : .weeks(Int64(weeks))
        case .years:
            let weeks = Double(self.count) * 52.1775
            return _slowPath(weeks > Double(Int64.max)) ? nil : .weeks(Int64(weeks))
        case .uniform:
            return .weeks(self.count)
        }
    }

    /// Casts current time unit to months.
    ///
    /// Conversion with precision loss. For example:
    ///
    ///     .weeks(7).months // .months(1)
    ///
    /// Can return `nil` if new duration is overflow.
    @inlinable public var months: Duration? {
        switch self.unit {
        case .nanoseconds:
            return .months(divisionBy2629746000000000(self.count))
        case .microseconds:
            return .months(divisionBy2629746000000(self.count))
        case .milliseconds:
            return .months(divisionBy2629746000(self.count))
        case .seconds:
            return .months(self.count / 2629746)
        case .minutes:
            return .months(Int64(Double(self.count) / 43829.1))
        case .hours:
            return .months(Int64(Double(self.count) / 730.485))
        case .days:
            return .months(Int64(Double(self.count) / 30.436875))
        case .weeks:
            return .months(Int64(Double(self.count) / 4.348125))
        case .months:
            return self
        case .years:
            let (months, overflow) = self.count.multipliedReportingOverflow(by: 12)
            return _slowPath(overflow) ? nil : .months(months)
        case .uniform:
            return .months(self.count)
        }
    }

    /// Casts current time unit to years.
    ///
    /// Conversion with precision loss. For example:
    ///
    ///     .months(23).years // .years(1)
    ///
    /// Can return `nil` if new duration is overflow.
    @inlinable public var years: Duration? {
        switch self.unit {
        case .nanoseconds:
            return .years(divisionBy31556952000000000(self.count))
        case .microseconds:
            return .years(divisionBy31556952000000(self.count))
        case .milliseconds:
            return .years(divisionBy31556952000(self.count))
        case .seconds:
            return .years(self.count / 31556952)
        case .minutes:
            return .years(Int64(Double(self.count) / 525949.2))
        case .hours:
            return .years(Int64(Double(self.count) / 8765.82))
        case .days:
            return .years(Int64(Double(self.count) / 365.2425))
        case .weeks:
            return .years(Int64(Double(self.count) / 52.1775))
        case .months:
            return .years(self.count / 12)
        case .years:
            return self
        case .uniform:
            return .years(self.count)
        }
    }
}

/// Internal functions
extension Duration {
    @usableFromInline
    internal func cast(to unit: DurationUnit) -> Duration? {
        switch unit {
        case .nanoseconds:
            return self.nanoseconds
        case .microseconds:
            return self.microseconds
        case .milliseconds:
            return self.milliseconds
        case .seconds:
            return self.seconds
        case .minutes:
            return self.minutes
        case .hours:
            return self.hours
        case .days:
            return self.days
        case .weeks:
            return self.weeks
        case .months:
            return self.months
        case .years:
            return self.years
        case .uniform:
            return self
        }
    }
}

extension Duration: Equatable {
    /// Returns a Boolean value indicating whether two durations are equal.
    ///
    /// Two durations are equal if their `count` for the type common to both instances are equal.
    /// For example:
    ///
    ///     print(Duration.microseconds(100) == Duration.microseconds(100)) // true
    ///     print(Duration.milliseconds(100) == 100) // true
    ///     print(Duration.seconds(60) == Duration.minutes(1)) // true
    ///
    /// - SeeAlso: `init(count:)` for information on `uniform` time unit.
    @inlinable
    public static func == (lhs: Duration, rhs: Duration) -> Bool {
        let lowerUnit = Swift.min(lhs.unit, rhs.unit)

        guard let lhs = lhs.cast(to: lowerUnit) else {
            return false
        }

        guard let rhs = rhs.cast(to: lowerUnit) else {
            return false
        }

        return lhs.count == rhs.count
    }
}

extension Duration: Comparable {
    ///
    @inlinable
    public static func < (lhs: Duration, rhs: Duration) -> Bool {
        let lowerUnit = Swift.min(lhs.unit, rhs.unit)

        guard let lhs = lhs.cast(to: lowerUnit) else {
            return false
        }

        guard let rhs = rhs.cast(to: lowerUnit) else {
            return true
        }

        return lhs.count < rhs.count
    }

    ///
    @inlinable
    public static func <= (lhs: Duration, rhs: Duration) -> Bool {
        let lowerUnit = Swift.min(lhs.unit, rhs.unit)

        guard let lhs = lhs.cast(to: lowerUnit) else {
            return false
        }

        guard let rhs = rhs.cast(to: lowerUnit) else {
            return true
        }

        return lhs.count <= rhs.count
    }

    ///
    @inlinable
    public static func > (lhs: Duration, rhs: Duration) -> Bool {
        let lowerUnit = Swift.min(lhs.unit, rhs.unit)

        guard let lhs = lhs.cast(to: lowerUnit) else {
            return true
        }

        guard let rhs = rhs.cast(to: lowerUnit) else {
            return false
        }

        return lhs.count > rhs.count
    }

    ///
    @inlinable
    public static func >= (lhs: Duration, rhs: Duration) -> Bool {
        let lowerUnit = Swift.min(lhs.unit, rhs.unit)

        guard let lhs = lhs.cast(to: lowerUnit) else {
            return true
        }

        guard let rhs = rhs.cast(to: lowerUnit) else {
            return false
        }

        return lhs.count >= rhs.count
    }
}

extension Duration: AdditiveArithmetic {
    /// Uniform time unit with `count` equal to zero.
    ///
    /// Zero is the identity element for addition. For any duration,
    /// `x + .zero == x` and `.zero + x == x`.
    @inlinable public static var zero: Duration {
        return .init()
    }

    /// Adds two durations and produces their sum.
    ///
    /// The addition operator (`+`) calculates the sum of its two arguments.
    /// For example:
    ///
    ///     let duration1 = 100 + .microseconds(200)             // 300 microseconds
    ///     let duration2 = .microseconds(30) + .milliseconds(1) // 1030 microseconds
    ///
    /// - Note: Overflow stops your program.
    @inlinable
    public static func + (lhs: Duration, rhs: Duration) -> Duration {
        let lowerUnit = Swift.min(lhs.unit, rhs.unit)

        let lhs = lhs.cast(to: lowerUnit)!
        let rhs = rhs.cast(to: lowerUnit)!

        return .init(count: lhs.count + rhs.count, unit: lowerUnit)
    }

    /// Adds two durations and stores the result in the left-hand-side variable.
    ///
    /// - SeeAlso: `Duration.+(lhs:,rhs:)`.
    @inlinable
    public static func += (lhs: inout Duration, rhs: Duration) {
        lhs = lhs + rhs
    }

    /// Subtracts one duration from another and produces their difference.
    ///
    /// The subtraction operator (`-`) calculates the difference of its two
    /// arguments. For example:
    ///
    ///     let duration1 = 100 - .microseconds(200)             // -100 microseconds
    ///     let duration2 = .milliseconds(1) - .microseconds(30) // 970 microseconds
    ///
    /// - Note: Overflow stops your program.
    @inlinable
    public static func - (lhs: Duration, rhs: Duration) -> Duration {
        let lowerUnit = Swift.min(lhs.unit, rhs.unit)

        let lhs = lhs.cast(to: lowerUnit)!
        let rhs = rhs.cast(to: lowerUnit)!

        return .init(count: lhs.count - rhs.count, unit: lowerUnit)
    }

    /// Subtracts the second duration from the first and stores the difference in the
    /// left-hand-side variable.
    ///
    /// - SeeAlso: `Duration.-(lhs:,rhs:)`.
    @inlinable
    public static func -= (lhs: inout Duration, rhs: Duration) {
        lhs = lhs - rhs
    }
}

extension Duration {
    /// Multiplies two durations and produces their product.
    ///
    /// The multiplication operator (`*`) calculates the product of its two
    /// arguments. For example:
    ///
    ///     let duration1 = 2 * .microseconds(200)              // 400 microseconds
    ///     let duration2 = .microseconds(2) * .milliseconds(1) // 2000 microseconds
    ///
    /// - Note: Overflow stops your program.
    @inlinable
    public static func * (lhs: Duration, rhs: Duration) -> Duration {
        let lowerUnit = Swift.min(lhs.unit, rhs.unit)

        let lhs = lhs.cast(to: lowerUnit)!
        let rhs = rhs.cast(to: lowerUnit)!

        return .init(count: lhs.count * rhs.count, unit: lowerUnit)
    }

    /// Multiplies two durations and stores the result in the left-hand-side variable.
    ///
    /// - SeeAlso: `Duration.*(lhs:,rhs:)`.
    @inlinable
    public static func *= (lhs: inout Duration, rhs: Duration) {
        lhs = lhs * rhs
    }

    /// Returns the quotient of dividing the first duration by the second.
    ///
    /// The division operator (`/`) calculates the quotient of dividing the
    /// first duration by the second. Any remainder of the division is
    /// discarded. For example:
    ///
    ///     let duration1 = .microseconds(500) / .microseconds(50) // 10 microseconds
    ///     let duration2 = .milliseconds(1) / .microseconds(450)  // 2 microseconds
    ///
    /// - Note: Overflow stops your program.
    @inlinable
    public static func / (lhs: Duration, rhs: Duration) -> Duration {
        let lowerUnit = Swift.min(lhs.unit, rhs.unit)

        let lhs = lhs.cast(to: lowerUnit)!
        let rhs = rhs.cast(to: lowerUnit)!

        return .init(count: lhs.count / rhs.count, unit: lowerUnit)
    }

    /// Divides the first duration by the second and stores the quotient in
    /// the left-hand-side variable.
    ///
    /// - SeeAlso: `Duration./(lhs:,rhs:)`.
    @inlinable
    public static func /= (lhs: inout Duration, rhs: Duration) {
        lhs = lhs / rhs
    }

    /// Returns the remainder of dividing the first duration by the second.
    ///
    /// For example:
    ///
    ///     let duration1 = .microseconds(500) / .microseconds(50) // 0 microseconds
    ///     let duration2 = .milliseconds(1) / .microseconds(450)  // 100 microseconds
    ///
    /// - Note: Overflow stops your program.
    @inlinable
    public static func % (lhs: Duration, rhs: Duration) -> Duration {
        let lowerUnit = Swift.min(lhs.unit, rhs.unit)

        let lhs = lhs.cast(to: lowerUnit)!
        let rhs = rhs.cast(to: lowerUnit)!

        return .init(count: lhs.count % rhs.count, unit: lowerUnit)
    }

    /// Divides the first duration by the second and stores the remainder in
    /// the left-hand-side variable.
    ///
    /// - SeeAlso: `Duration.%(lhs:,rhs:)`.
    @inlinable
    public static func %= (lhs: inout Duration, rhs: Duration) {
        lhs = lhs % rhs
    }
}
