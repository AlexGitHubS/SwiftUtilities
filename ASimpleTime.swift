//  ASimpleTime.swift//
//  Created by Alex on 2017-11-02.
//  Copyright © 2017 Alexei Kozachenko. All rights reserved.


import Foundation

/// Represents human readable time, in seconds, minutes, hours and days
struct ASimpleTime: CustomStringConvertible {
    //Types
    typealias Epoch = Int64
    typealias Seconds = UInt8 //represents seconds: 1-60
    typealias Minutes = UInt8 //represents minutes: 1-60
    typealias Hours = UInt8 //represents hours: 1-60
    typealias Days = UInt16 // max 65535
    
    //Private variables used for calculation
    private let secondsInAMinute:Double = 60
    private let secondsInAnHour:Double = 60 * 60
    private let secondsInADay:Double = 24 * 60 * 60
    
    //MARK:- calss variables
    var seconds: Seconds = 0
    var minutes: Minutes = 0
    var hours: Hours = 0
    var days: Days = 0
    
    var absoluteSeconds: Int = 0
    
    //MARK:- Initialization
    init() { }
    
    init(fromSeconds: Int) {
        self.absoluteSeconds = fromSeconds
        set(fromSeconds: absoluteSeconds)
    }
    
    //CustomStringConvertible
    var description: String {
        return "\(days) days, \(self.hours) hours, \(self.minutes) minutes, \(seconds) seconds"
    }
    
    private mutating func set(fromSeconds: Int) {
        let seconds:Double = Double(fromSeconds)
        
        let daysMaxValDouble = Double(Days.max)
        var _days = floor(seconds / secondsInADay)
        
        let hourSeconds = seconds.truncatingRemainder(dividingBy: secondsInADay) //how many minutes left if convert seconds to days (86420sec is 1 day and 20 sec is a reminder which is 0 minutes
        var _hours = Hours(floor(hourSeconds / secondsInAnHour));
        
        let minuteSeconds = hourSeconds.truncatingRemainder(dividingBy: secondsInAnHour); //how many minutes in remain
        var _minutes = Minutes(floor(minuteSeconds / secondsInAMinute))
        
        let remainingSeconds = minuteSeconds.truncatingRemainder(dividingBy: secondsInAMinute);
        var _seconds = Seconds(ceil(remainingSeconds))
        
        if _days > daysMaxValDouble {
            _seconds = 59
            _minutes = 59
            _hours = 23
            _days = daysMaxValDouble
        }
        self.seconds = _seconds
        self.minutes = _minutes
        self.hours = _hours
        self.days = Days(_days)
    }
    
    mutating func reset() {
        self.seconds = 0
        self.minutes = 0
        self.hours = 0
        self.days = 0
    }
    
    mutating func deduct(seconds: Int) {
        let newAbsolute = absoluteSeconds - seconds
        guard (newAbsolute > 0) else {
            reset()
            return
        }
        self.absoluteSeconds = newAbsolute
        set(fromSeconds: absoluteSeconds)
    }
}
