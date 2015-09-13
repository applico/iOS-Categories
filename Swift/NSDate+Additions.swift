//
//  NSDate+Additions.swift
//  iOSCategories
//
//  Created by Applico on 6/2/15.
//  Copyright (c) 2015 Applico Inc. All rights reserved.
//

import Foundation

extension NSDate {
    
    func previousDay() -> NSDate? {
        
        let calendar = NSCalendar.currentCalendar()
        let dateComponents = calendar.components(NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitHour | NSCalendarUnit.CalendarUnitMinute, fromDate: self)
        
        dateComponents.day = dateComponents.day - 1
        
        return calendar.dateFromComponents(dateComponents)
    }
    
    func previousDayWithoutTime() -> NSDate? {
        
        let calendar = NSCalendar.currentCalendar()
        let dateComponents = calendar.components(NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitHour | NSCalendarUnit.CalendarUnitMinute, fromDate: self)
        
        dateComponents.day = dateComponents.day - 1
        dateComponents.hour = 0
        dateComponents.minute = 0
        dateComponents.second = 0
        
        return calendar.dateFromComponents(dateComponents)
    }
    
    func dateWithoutTime() -> NSDate? {
        
        let calendar = NSCalendar.currentCalendar()
        let dateComponents = calendar.components(NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitHour | NSCalendarUnit.CalendarUnitMinute, fromDate: self)

        dateComponents.hour = 0
        dateComponents.minute = 0
        dateComponents.second = 0
        
        return calendar.dateFromComponents(dateComponents)
    }
    
    func shortStyleTimeString() -> String {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.NoStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeZone = NSTimeZone(abbreviation: "UTC")
        
        return dateFormatter.stringFromDate(self)
    }
    
    func shortStyleString() -> String {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeZone = NSTimeZone(abbreviation: "UTC")
        
        return dateFormatter.stringFromDate(self)
    }
    
    func longStyleString() -> String {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.LongStyle
        dateFormatter.timeZone = NSTimeZone(abbreviation: "UTC")
        
        return dateFormatter.stringFromDate(self)
    }
    
    func dateWithUTCTimeZone() -> NSDate? {
        
        let calendar = NSCalendar.currentCalendar()
        let dateComponents = calendar.components(NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitHour | NSCalendarUnit.CalendarUnitMinute, fromDate: self)
        
        calendar.timeZone = NSTimeZone.localTimeZone()
        
        return calendar.dateFromComponents(dateComponents)
    }
    
    func daysAndHoursSinceDate() -> String {
        
        var returnString = String()
        let calendar = NSCalendar.currentCalendar()
        calendar.timeZone = NSTimeZone.localTimeZone()
        
        let components = calendar.components(NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitHour | NSCalendarUnit.CalendarUnitMinute, fromDate: self, toDate: NSDate(), options: NSCalendarOptions(0))
        
        if components.month > 0 {
            if components.month > 1 {
                returnString = returnString + "s"
            }
            returnString = returnString + String(format: "%ldM", components.month)
        }
        
        if components.day > 0 {
            if components.day > 1 {
                returnString = returnString + "s"
            }
            returnString = returnString + String(format: "%ldd", components.day)
        }
        
        if components.hour > 0 {
            if components.hour > 1 {
                returnString = returnString + "s"
            }
            returnString = returnString + String(format: "%ldh", components.hour)
        }
        
        if components.minute > 0 {
            if components.minute > 1 {
                returnString = returnString + "s"
            }
            returnString = returnString + String(format: "%ld min", components.minute)
        }
        
        if !returnString.isEmpty {
            return returnString + " ago"
        }
        
        return "now"
    }
}