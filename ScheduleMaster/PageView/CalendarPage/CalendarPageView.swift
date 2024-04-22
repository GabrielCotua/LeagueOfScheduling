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
    @Binding var selectedDay: String
    @State private var maincolor: Color = .blue
    @State private var SecondColor: Color = .green
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
        NavigationStack{
            VStack {
                //  LabeledContent("Calendar Color") {
                //    ColorPicker("", selection: $color, supportsOpacity: false)
                //    }
                
                LabeledContent("Date/Time") {
                    
                    
                    DatePicker("", selection: $date, displayedComponents: .date)
                    Button( action: {
                        date = Date.now
                    }) {
                        Text("Today")
                    }
                    .buttonStyle(DefaultButtonStyle())
                }
                .padding()
                Section {
                    HStack{
                        ForEach(daysOfWeek.indices, id: \.self) { index in
                            Text(daysOfWeek[index])
                                .fontWeight(.black)
                                .foregroundStyle(maincolor)
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
                                    //print("Tapped on \(Date().formatted(myFormat))")
                                    //print("\(Date().formatted(.dateTime.day()))")
                                    
                                    selectedDay = day.formatted(.dateTime.day()) //stores the date that you tapped on
                                    // print(day.formatted(.dateTime.day())) //used to know where I am clicking on
                                }) {
                                    // Text that becomes interactive
                                    
                                    Text(day.formatted(.dateTime.day()))
                                        .fontWeight(.bold)
                                        .foregroundStyle(.secondary)
                                        .frame(maxWidth: .infinity, minHeight: 40)
                                        .background(
                                            Circle()
                                                .foregroundStyle(
                                                     Date.now.startOfDay == day.startOfDay
                                                    ? .red.opacity(0.3)
                                                     
                                                    : date.formatted(.dateTime.day()) == day.formatted(.dateTime.day())
                                                    ? .yellow.opacity(0.3)
                                                    
                                                    : day.formatted(.dateTime.day()) == selectedDay || day.formatted(.dateTime.day()) == date.formatted(.dateTime.day())
                                                        ? .green.opacity(0.3)
                                                    
                                                    // Changes the color of the day we are currently on based on the system date
                                                    
                                                    // Regular day for the whole calendar
                                                    : maincolor.opacity(0.3)
                                                )
                                        )
                                }
                                .buttonStyle(PlainButtonStyle())
                                // Use plain button style to remove the default button style
                            }
                        } // end of the foreach loop
                    } //end bracket of the LazyGrid layout
                    
                    
                    TabView {
                        TaskViewsIntoCalendarView(tasks: $tasks, selectedDay: $selectedDay)
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
            .navigationTitle("Calendar")
        }
    }
}

#Preview {
    @State var task: [Task] = []
    @State var selectedDay = String()
    return CalendarPageView(tasks: $task, selectedDay: $selectedDay)
}
