//
//  Date+Extention.swift
//  ScheduleMaster
//
//  Created by 64023073 on 3/15/24.
//

import Foundation
import SwiftUI

extension Date {
    //// credits to: https://gist.github.com/StewartLynch/90ecac7eff9fe438bba580e96643fe70
    static var capitalizedFirstLettersOfWeekdays: [String] {
        let calendar = Calendar.current
        let weekdays = calendar.shortWeekdaySymbols

        return weekdays.map { weekday in
            guard let firstLetter = weekday.first else { return "" }
            return String(firstLetter).capitalized
        }
    }
    
    static var fullMonthNames: [String] {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current

        return (1...12).compactMap { month in
            dateFormatter.setLocalizedDateFormatFromTemplate("MMMM")
            let date = Calendar.current.date(from: DateComponents(year: 2000, month: month, day: 1))
            return date.map { dateFormatter.string(from: $0) }
        }
    }
    //variable that controls the starting day of the month
    var startOfMonth: Date {
        Calendar.current.dateInterval(of: .month, for: self)!.start
    }
    //variable that controls the ending day of the month
    var endOfMonth: Date {
        let lastDay = Calendar.current.dateInterval(of: .month, for: self)!.end
        return Calendar.current.date(byAdding: .day, value: -1, to: lastDay)!
    }
    
    var startOfPreviousMonth: Date {
        let dayInPreviousMonth = Calendar.current.date(byAdding: .month, value: -1, to: self)!
        return dayInPreviousMonth.startOfMonth
    }
    
    var numberOfDaysInMonths: Int {
        Calendar.current.component(.day, from: endOfMonth)
    }
    
    var sundayBeforeStart: Date {
        let startOfMonthWeekday = Calendar.current.component(.weekday, from: startOfMonth)
        let numberFromPreviousMonth = startOfMonthWeekday - 1
        return Calendar.current.date(byAdding: .day, value: -numberFromPreviousMonth, to: startOfMonth)!
    }
    
    var calendarDisplayDays: [Date] {
        var days: [Date] = []
        //current months days
        for dayOffset in 0..<numberOfDaysInMonths{
            let newDay = Calendar.current.date(byAdding: .day, value: dayOffset, to: startOfMonth)
            days.append(newDay!)
        }
        
        //previous months days
        for dayOffset in 0..<startOfPreviousMonth.numberOfDaysInMonths{
            let newDay = Calendar.current.date(byAdding: .day, value: dayOffset, to: startOfPreviousMonth)
            days.append(newDay!)
        }
        return days.filter { $0 >= sundayBeforeStart && $0 <= endOfMonth}.sorted(by: <)
    }
    
    var monthInt: Int {
        Calendar.current.component(.month, from: self) // gives you the value of the month that you value "Date"
    }
    
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }

    var nextMonth: Date {
        let month = Calendar.current.date(byAdding: .month, value: 1, to: self)! // goes to following month
        return month
    }
    
    var prevMonth: Date {
        let month = Calendar.current.date(byAdding: .month, value: -1, to: self)! // goes to previous month
        return month
    }
    
    var monthNamesProtection: Date { // checks for month stay between 1 and 12
        var date = self
        if ((date.monthInt) > 12) {
            date = Calendar.current.date(bySetting: .month, value: 1, of: date)! // set the month to 1 (January)
        }
        if ((date.monthInt) < 1) {
            date = Calendar.current.date(bySetting: .month, value: 12, of: date)! // set the month to 12 (December)
        }
        return date
    }
    func hasTasks(tasks: Binding<[Task]>, date: Date) -> Int {
        let calendar = Calendar.current
        
        var n = 0
        tasks.wrappedValue.forEach { task in
            if (calendar.isDate(task.dateStart, inSameDayAs: date)) {
                n = n + 1
            }
        }
        return n
    }
    

    

}
