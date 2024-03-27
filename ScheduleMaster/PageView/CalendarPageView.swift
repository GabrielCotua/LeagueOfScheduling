//
//  CalendarPageView.swift
//  ScheduleMaster
//
//  Created by 64023073 on 3/15/24.
//
// reference https://www.youtube.com/watch?v=X_boPC1tg_Y
import SwiftUI

struct CalendarPageView: View {
    @State private var color: Color = .blue
    @State private var date = Date.now
    let daysOfWeek = Date.capitalizedFirstLettersOfWeekdays
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    @State private var days: [Date] = []
    var body: some View {
        
        
        VStack {
            LabeledContent("Calendar Color") {
                ColorPicker("", selection: $color, supportsOpacity: false)
            }
            
            LabeledContent("Date/Time") {
                DatePicker("", selection: $date)
            }
            
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
                        //try not to touch the text below, somehow is working now
                        Text(day.formatted(.dateTime.day()))
                            .fontWeight(.bold)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .background(
                                Circle()
                                    .foregroundStyle(
                                        
                                        //changes the color of the day we are currently on
                                        Date.now.startOfDay == day.startOfDay
                                        ? .red.opacity(0.3)
                                        //regular day for the whole calendar
                                        : color.opacity(0.3)
                                    )
                            )
                    }
                }
            }
            LazyVStack {
                ForEach(1...10, id: \.self) { count in
                    Text("Task del Dia \(count)")
                        .background(
                            Rectangle()
                                .foregroundStyle(
                                    .opacity(0.3)
                                )
                            )
                }
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
    CalendarPageView()
}
