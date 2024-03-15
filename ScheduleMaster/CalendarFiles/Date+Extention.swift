//
//  Date+Extention.swift
//  ScheduleMaster
//
//  Created by 64023073 on 3/15/24.
//

import Foundation

extension Date {
    //https://gist.github.com/StewartLynch/90ecac7eff9fe438bba580e96643fe70
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
}
