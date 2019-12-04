//
//  Date+Ext.swift
//  Shifts
//
//  Created by Alexander Yolkin on 11/19/19.
//  Copyright © 2019 Oleksandr Yolkin. All rights reserved.
//

import Foundation

extension Date {
    func getHumanReadableDayString() -> String {
        let weekdays = [
            "Sun",
            "Mon",
            "Tue",
            "Wed",
            "Thu",
            "Fri",
            "Sat"
        ]
        
        let calendar = Calendar.current.component(.weekday, from: self)
        return weekdays[calendar-1]
    }
    
    func getDay() -> Int {
        let weekday = Calendar.current.component(.day, from: self)
        return weekday
    }
    
    func getMonth() -> Int {
        let month = Calendar.current.component(.month, from: self)
        return month
    }
    
    func getHour() -> Int {
        let hour = Calendar.current.component(.hour, from: self)
        return hour
    }
    
    func getHour12String() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h a"
        let hour12 = dateFormatter.string(from: self)
        return hour12
    }
    
    func getStringFromDateShort() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let str = dateFormatter.string(from: self)
        return str
    }
    
    func getStringFromDateLong() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        let str = dateFormatter.string(from: self)
        return str
    }
}
