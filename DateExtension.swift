//  DateExtension.swift
//  Created by Alex on 12/9/16.
//  Copyright © 2016 Alex Kozachenko. All rights reserved.
import Foundation

extension Date {
    
<<<<<<< HEAD
    public enum dayName: Int {
=======
    enum dayName: Int {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        case Sunday = 1, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
    }
    
    enum monthName: String {
        case January = "January"
        case February = "February"
        case March = "March"
        case April = "April"
        case May = "May"
        case June = "June"
        case July = "July"
        case August = "August"
        case September = "September"
        case October = "October"
        case November = "November"
        case December = "December"
        
<<<<<<< HEAD
        public func number() -> Int {
=======
        func number() -> Int {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
            switch self {
            case .January:
                return 1
            case .February:
                return 2
            case .March:
                return 3
            case .April:
                return 4
            case .May:
                return 5
            case .June:
                return 6
            case .July:
                return 7
            case .August:
                return 8
            case .September:
                return 9
            case .October:
                return 10
            case .November:
                return 11
            case .December:
                return 12
            }
        }
    }
    
    /// Default values of timeZone and Calendar for DateFormater are user's current settings & location
    /// TimeZone.knownTimeZoneIdentifiers - all string values for timeZone
    
<<<<<<< HEAD
    public func toString(dateStyle: DateFormatter.Style = DateFormatter.Style.short, timeStyle: DateFormatter.Style = .none, fromCalendar: Calendar.Identifier = .gregorian , forTimeZone: TimeZone = .current) -> String {
=======
    func toString(dateStyle: DateFormatter.Style = DateFormatter.Style.short, timeStyle: DateFormatter.Style = .none, fromCalendar: Calendar.Identifier = .gregorian , forTimeZone: TimeZone = .current) -> String {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        
        let formater = DateFormatter()
        formater.dateStyle = dateStyle
        formater.timeStyle = timeStyle
        formater.timeZone = forTimeZone
        formater.calendar = Calendar(identifier: fromCalendar)
        
        return formater.string(from: self)
    }
    
<<<<<<< HEAD
    public func toString(withFormat: String) -> String {
=======
    func toString(withFormat: String) -> String {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        
        let formater = DateFormatter()
        formater.calendar = Calendar.current
        formater.dateFormat = withFormat
        
        return formater.string(from: self)
    }
    
    ///returns the same `Date` with hour, minute and second set to 00:00:00
<<<<<<< HEAD
    public func startOfDay(timeZone: TimeZone = .current) -> Date {
=======
    func startOfDay(timeZone: TimeZone = .current) -> Date {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        let components = self.dateComponentsFromDate([.day,.month,.year])
        let startDate = Date.dateFromComponents(year: components.year!, month: components.month!, day: components.day!, hour: 0, minute: 0, second: 0, timeZone: timeZone)
        
        return startDate!
    }
    ///returns the same `Date` with hour, minute and second set to 23:59:59
<<<<<<< HEAD
    public func endOfDay(timeZone: TimeZone = .current) -> Date {
=======
    func endOfDay(timeZone: TimeZone = .current) -> Date {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        let components = self.dateComponentsFromDate([.day,.month,.year])
        let startDate = Date.dateFromComponents(year: components.year!, month: components.month!, day: components.day!, hour: 23, minute: 59, second: 59, timeZone: timeZone)
        
        return startDate!
    }
    
    //ex: "Apr 21, 2016, 1:19 PM"
    ///returns the `Date` that was exactly 24 hours ago
<<<<<<< HEAD
    public func yesturday() -> Date {
=======
    func yesturday() -> Date {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        return self.addingTimeInterval(-86400.0)
    }
    
    //ex: "Apr 23, 2016, 1:19 PM"
    ///returns the `Date` that will be exactly 24 hours since date
<<<<<<< HEAD
    public func tomorrow() -> Date {
=======
    func tomorrow() -> Date {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        return self.addingTimeInterval(86400.0)
    }
    
    ///returns the `Date` that was N days ago
<<<<<<< HEAD
    public func daysAgo(_ days: Double) -> Date {
        return self.addingTimeInterval(-86400.0 * days)
    }
    ///returns the `Date` that will be in N days
    public func inDays(_ days: Double) -> Date {
=======
    func daysAgo(_ days: Double) -> Date {
        return self.addingTimeInterval(-86400.0 * days)
    }
    ///returns the `Date` that will be in N days
    func inDays(_ days: Double) -> Date {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        return self.addingTimeInterval(86400.0 * days)
    }
    
    ///returns array of specified `DateComponents` from the `Date`
<<<<<<< HEAD
    public func dateComponentsFromDate(_ withComponents: Set<Calendar.Component>) -> DateComponents {
=======
    func dateComponentsFromDate(_ withComponents: Set<Calendar.Component>) -> DateComponents {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let components = (calendar as Calendar).dateComponents(withComponents, from: self)
        return components
    }
    
    //MARK:- COMPONENTS FROM DATE
    ///returns number of day 1-7 from the `Date`
<<<<<<< HEAD
    public func day() -> Int {
=======
    func day() -> Int {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        let selfComponents = self.dateComponentsFromDate([.day])
        guard let day = selfComponents.day else { return 0 }
        return day
    }
    ///returns number of day 1-12 from the `Date`
<<<<<<< HEAD
    public func month() -> Int {
=======
    func month() -> Int {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        let selfComponents = self.dateComponentsFromDate([.month])
        guard selfComponents.month != nil else { return 0 }
        return selfComponents.month!
    }
    ///returns the year from the `Date`
<<<<<<< HEAD
    public func year() -> Int {
=======
    func year() -> Int {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        let selfComponents = self.dateComponentsFromDate([.year])
        guard selfComponents.year != nil else { return 0}
        return selfComponents.year!
    }
    
    //MARK:- COMPARING METHODS
    
    /// returns true if the `Date`'s day is the same as a day name specified
<<<<<<< HEAD
    public func isDay(dayName: dayName) -> Bool {
=======
    func isDay(dayName: dayName) -> Bool {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let dayNumber = (calendar as Calendar).component(Calendar.Component.weekday, from: self)
        
        return dayName.rawValue == (dayNumber) ? true : false
    }
    
    ///returns true if `Date` is the same or was before the specified `Date`. Compares only day, month and year.
<<<<<<< HEAD
    public func lessThanOrEqualTo(date secondDate: Date) -> Bool {
=======
    func lessThanOrEqualTo(date secondDate: Date) -> Bool {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        let selfComponents = self.dateComponentsFromDate([.year,.month,.day])
        let targetComponents = secondDate.dateComponentsFromDate([.year,.month,.day])
        
        if selfComponents.year! > targetComponents.year! { return false }
        else if selfComponents.year! < targetComponents.year! { return true }
            //same year
        else  {
            if selfComponents.month! > targetComponents.month! { return false }
            else if selfComponents.month! < targetComponents.month! { return true }
                //same month
            else {
                if selfComponents.day! <= targetComponents.day! { return true }
                else { return false }
            }
        }
    }
    ///returns true if `Date` was before the specified `Date`. Compares only day, month and year.
<<<<<<< HEAD
    public func lessThan(date secondDate: Date) -> Bool {
=======
    func lessThan(date secondDate: Date) -> Bool {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        let selfComponents = self.dateComponentsFromDate([.year,.month,.day])
        let targetComponents = secondDate.dateComponentsFromDate([.year,.month,.day])
        
        if selfComponents.year! > targetComponents.year! { return false }
        else if selfComponents.year! < targetComponents.year! { return true }
            //same year
        else  {
            if selfComponents.month! > targetComponents.month! { return false }
            else if selfComponents.month! < targetComponents.month! { return true }
                //same month
            else {
                //10 10
                if selfComponents.day! < targetComponents.day! { return true }
                else { return false }
            }
        }
    }
    ///returns true if `Date` is the same or comes after the specified `Date`. Compares only day, month and year.
<<<<<<< HEAD
    public func greaterThanOrEqual(date secondDate: Date) -> Bool {
=======
    func greaterThanOrEqual(date secondDate: Date) -> Bool {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        let selfComponents = self.dateComponentsFromDate([.year,.month,.day])
        let targetComponents = secondDate.dateComponentsFromDate([.year,.month,.day])
        
        if selfComponents.year! < targetComponents.year! { return false }
        if selfComponents.year! > targetComponents.year! { return true }
            
            //same year
        else  {
            if selfComponents.month! < targetComponents.month! { return false }
            else if selfComponents.month! > targetComponents.month! { return true }
                //same month
            else {
                if selfComponents.day! >= targetComponents.day! { return true }
                else { return false }
            }
        }
    }
    ///returns true if `Date` comes after the specified `Date`. Compares only day, month and year.
<<<<<<< HEAD
    public func greaterThan(date secondDate: Date) -> Bool {
=======
    func greaterThan(date secondDate: Date) -> Bool {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        let selfComponents = self.dateComponentsFromDate([.year,.month,.day])
        let targetComponents = secondDate.dateComponentsFromDate([.year,.month,.day])
        
        if selfComponents.year! < targetComponents.year! { return false }
        if selfComponents.year! > targetComponents.year! { return true }
            
            //same year
        else  {
            if selfComponents.month! < targetComponents.month! { return false }
            else if selfComponents.month! > targetComponents.month! { return true }
                //same month
            else {
                if selfComponents.day! > targetComponents.day! { return true }
                else { return false }
            }
        }
    }
    ///returns true if day month and year matches to the `Date`
<<<<<<< HEAD
    public func isSameDay(date: Date) -> Bool {
=======
    func isSameDay(date: Date) -> Bool {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        let selfComponents = self.dateComponentsFromDate([.year,.month,.day])
        let targetComponents = date.dateComponentsFromDate([.year,.month,.day])
        
        if (selfComponents.year == targetComponents.year) && (selfComponents.month == targetComponents.month) && (selfComponents.day == targetComponents.day) {
            return true
        }
        return false
    }

    
    //MARK:- Static methods
    
    ///returns number of dates between two specified `Date`s. Inclusive by default (including
    
<<<<<<< HEAD
    static public func NumberOfDaysBetweenDates(fromDate date1: Date, toDate date2: Date, inclusive: Bool = true) -> Int {
=======
    static func NumberOfDaysBetweenDates(fromDate date1: Date, toDate date2: Date, inclusive: Bool = true) -> Int {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        var nDays = 0
        
        if date1.isSameDay(date: date2) { return nDays }
        
        
        let startDate = date1.lessThan(date: date2) ? date1 : date2
        let endDate = startDate == date1 ? date2 : date1
        
        var from = startDate
        
        //FIXME: use interval between and then convert to days
        while (from.isSameDay(date: endDate) != true) {
            nDays += 1
            from = from.inDays(1)
        }
        
        //include one last day also
        if inclusive { nDays += 1 }
        
        return nDays
    }
    
    ///Returns string formated Date in specified format. 'dd-MMM-yy' by defaylt
<<<<<<< HEAD
    static public func getStringFromDate(date: Date, format: String = "dd-MMM-yy") -> String {
=======
    static func getStringFromDate(date: Date, format: String = "dd-MMM-yy") -> String {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        let formater = DateFormatter()
        formater.dateFormat = format
        let orderDate = formater.string(from: date)
        return orderDate
    }
    
    ///Creates a `Date` from specified components.
<<<<<<< HEAD
    static public func dateFromComponents(year: Int, month: Int, day: Int, hour: Int = 12, minute: Int = 0, second: Int = 0, timeZone tZ: TimeZone = .current) -> Date? {
=======
    static func dateFromComponents(year: Int, month: Int, day: Int, hour: Int = 12, minute: Int = 0, second: Int = 0, timeZone tZ: TimeZone = .current) -> Date? {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        // Specify date components
        var dateComponents = DateComponents()
        
        dateComponents.timeZone = tZ
        
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = second
        
        // Create date from components
        let userCalendar = Calendar.current // user calendar
        return userCalendar.date(from: dateComponents)
    }
    
    ///Creates a `Date` in a specified format. Default is "dd/MM/yyyy" format
<<<<<<< HEAD
    static public func dateFromString(date: String, format: String = "dd/MM/yyyy") -> Date? {
=======
    static func dateFromString(date: String, format: String = "dd/MM/yyyy") -> Date? {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let someDateTime = formatter.date(from: date)
        return someDateTime
    }
    
    ///returns Date in "dd/MM/yyyy-hh:mm aa" format
<<<<<<< HEAD
    static public func dateFromStringFromTimeZone(date: String, format: String = "dd/MM/yyyy-hh:mm aa", timeZone: String = "GMT+0:00") -> Date? {
=======
    static func dateFromStringFromTimeZone(date: String, format: String = "dd/MM/yyyy-hh:mm aa", timeZone: String = "GMT+0:00") -> Date? {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        let formater = DateFormatter()
        formater.dateFormat = format
        formater.timeZone = TimeZone(identifier: timeZone)
        
        return formater.date(from: date)
    }
    
<<<<<<< HEAD
    static public func minutesIn(days: Double) -> Double {
        return days*24*60
    }
    static public func minutesIn(hours: Double) -> Double {
        return hours*60
    }
    static public func secondsIn(days: Double) -> Double {
        return days*24*60*60
    }
    static public func secondsIn(hours: Double) -> Double {
        return hours*60*60
    }
    static public func secondsIn(minutes: Double) -> Double {
=======
    static func minutesIn(days: Double) -> Double {
        return days*24*60
    }
    static func minutesIn(hours: Double) -> Double {
        return hours*60
    }
    static func secondsIn(days: Double) -> Double {
        return days*24*60*60
    }
    static func secondsIn(hours: Double) -> Double {
        return hours*60*60
    }
    static func secondsIn(minutes: Double) -> Double {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        return minutes*60
    }
    
    //MARK: TIME ZONE NAMES
    
    ///return all European Time Zone Identifiers
<<<<<<< HEAD
    static public func EuropeanTimeZoneNames() -> [String] {
=======
    static func EuropeanTimeZoneNames() -> [String] {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        return TimeZone.knownTimeZoneIdentifiers.filter { (zName) in
            return zName.hasPrefix("Euro")
        }
    }
    
    //MARK:- Comparison methods overload
    ///overload method for greaterThan(_:) method. Returns true if lhs `Date` comes after rhs `Date`. (Compares Year, Month, Day)
<<<<<<< HEAD
    static public func >(lhs: Date, rhs: Date) -> Bool {
        return lhs.greaterThan(date: rhs)
    }
    ///overload method for lessThan(_:) method. Returns true if lhs `Date` comes before rhs `Date`. (Compares Year, Month, Day)
    static public func <(lhs: Date, rhs: Date) -> Bool {
        return lhs.lessThan(date: rhs)
    }
    ///overload method for greaterThanOrEqual(_:) method. Returns true if lhs `Date` comes after rhs `Date` or is the same `Date` as rhs `Date`. (Compares Year, Month, Day)
    static public func >=(lhs: Date, rhs: Date) -> Bool {
        return lhs.greaterThanOrEqual(date: rhs)
    }
    ///overload method for lessThanOrEqualTo(_:) method. Returns true if lhs `Date` comes before rhs `Date` or is the same `Date` as rhs `Date`. (Compares Year, Month, Day)
    static public func <=(lhs: Date, rhs: Date) -> Bool {
        return lhs.lessThanOrEqualTo(date: rhs)
    }
    ///returns true if lhs `Date` comes after rhs `Date` including time.
    static public func >>(lhs: Date, rhs: Date) -> Bool {
        return lhs.timeIntervalSinceReferenceDate > rhs.timeIntervalSinceReferenceDate
    }
    ///returns true if lhs `Date` comes before rhs `Date` including time.
    static public func <<(lhs: Date, rhs: Date) -> Bool {
        return lhs.timeIntervalSinceReferenceDate < rhs.timeIntervalSinceReferenceDate
    }
    ///overload method for isSameDay(_:) method. Returns true if lhs `Date`'s day is a same that rhs `Date`'s day. (Compares Year, Month, Day)
    static public func ==(lhs: Date, rhs: Date) -> Bool {
        return lhs.isSameDay(date: rhs)
    }
    ///returns true if lhs `Date` is the same as rhs `Date` including time.
    static public func ===(lhs: Date, rhs: Date) -> Bool {
=======
    static func >(lhs: Date, rhs: Date) -> Bool {
        return lhs.greaterThan(date: rhs)
    }
    ///overload method for lessThan(_:) method. Returns true if lhs `Date` comes before rhs `Date`. (Compares Year, Month, Day)
    static func <(lhs: Date, rhs: Date) -> Bool {
        return lhs.lessThan(date: rhs)
    }
    ///overload method for greaterThanOrEqual(_:) method. Returns true if lhs `Date` comes after rhs `Date` or is the same `Date` as rhs `Date`. (Compares Year, Month, Day)
    static func >=(lhs: Date, rhs: Date) -> Bool {
        return lhs.greaterThanOrEqual(date: rhs)
    }
    ///overload method for lessThanOrEqualTo(_:) method. Returns true if lhs `Date` comes before rhs `Date` or is the same `Date` as rhs `Date`. (Compares Year, Month, Day)
    static func <=(lhs: Date, rhs: Date) -> Bool {
        return lhs.lessThanOrEqualTo(date: rhs)
    }
    ///returns true if lhs `Date` comes after rhs `Date` including time.
    static func >>(lhs: Date, rhs: Date) -> Bool {
        return lhs.timeIntervalSinceReferenceDate > rhs.timeIntervalSinceReferenceDate
    }
    ///returns true if lhs `Date` comes before rhs `Date` including time.
    static func <<(lhs: Date, rhs: Date) -> Bool {
        return lhs.timeIntervalSinceReferenceDate < rhs.timeIntervalSinceReferenceDate
    }
    ///overload method for isSameDay(_:) method. Returns true if lhs `Date`'s day is a same that rhs `Date`'s day. (Compares Year, Month, Day)
    static func ==(lhs: Date, rhs: Date) -> Bool {
        return lhs.isSameDay(date: rhs)
    }
    ///returns true if lhs `Date` is the same as rhs `Date` including time.
    static func ===(lhs: Date, rhs: Date) -> Bool {
>>>>>>> 977b31ff8662e426bdf8e4657ce997f25811b015
        return lhs.timeIntervalSinceReferenceDate == rhs.timeIntervalSinceReferenceDate
    }
}
