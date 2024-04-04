//
//  CalendarPageView.swift
//  ScheduleMaster
//
//  Created by 64023073 on 3/15/24.
//
//  reference https://www.youtube.com/watch?v=X_boPC1tg_Y
import SwiftUI

struct CalendarPageView: View {
    @Binding var tasks: [Task]
    @State private var color: Color = .blue
    @State private var date = Date.now
    let daysOfWeek = Date.capitalizedFirstLettersOfWeekdays
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    let myFormat = Date.FormatStyle()
        .year()
        .day()
        .month()
        .locale(Locale(identifier: "en_US"))
    @State private var days: [Date] = []
    var body: some View {
        
        VStack {
        //  LabeledContent("Calendar Color") {
        //    ColorPicker("", selection: $color, supportsOpacity: false)
        //    }
            
            LabeledContent("Date/Time") {
                DatePicker("", selection: $date)
            }
                .padding()
            
            HStack{
                ForEach(daysOfWeek.indices, id: \.self) { index in
                    Text(daysOfWeek[index])
                        .fontWeight(.black)
                        .foregroundStyle(color)
                        .frame(maxWidth: .infinity)
                }
            }
            LazyVGrid(columns: columns) {
                ForEach(days, id: \.self) { day in
                    if day.monthInt != date.monthInt {
                        Text("")
                    } else {
                        Button(action: {
                            // Handle the action when the day is tapped
                            // Date().formatted(myFormat) is how I know the day that was tapped on, it gives the month day, year
                            print("Tapped on \(Date().formatted(myFormat))")
                        }) {
                            // Text that becomes interactive
                            Text(day.formatted(.dateTime.day()))
                                .fontWeight(.bold)
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity, minHeight: 40)
                                .background(
                                    Circle()
                                        .foregroundStyle(
                                            // Changes the color of the day we are currently on
                                            Date.now.startOfDay == day.startOfDay
                                                ? .red.opacity(0.3)
                                                // Regular day for the whole calendar
                                                : color.opacity(0.3)
                                        )
                                )
                        }
                        .buttonStyle(PlainButtonStyle()) 
                        // Use plain button style to remove the default button style
                    }
                }// end of the foreach loop
            } //end bracket of the LazyGrid layout

            
            TabView {
                TaskViewsIntoCalendarView(tasks: $tasks)
            }
            Spacer()
        }
        
        .padding()
        .onAppear {
            days = date.calendarDisplayDays
        }
        .onChange(of: date) {
            days = date.calendarDisplayDays
        }
    }
}

#Preview {
    @State var task: [Task] = []
    return CalendarPageView(tasks: $task)
}
