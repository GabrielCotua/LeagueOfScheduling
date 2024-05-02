//
//  CalendarPageView.swift
//  ScheduleMaster
//
//  Created by 64023073 on 3/15/24.
//
//  reference https://www.youtube.com/watch?v=X_boPC1tg_Y


import SwiftUI
import Foundation

struct CalendarPageView: View {
    @Binding var tasks: [Task]
    @Binding var oldTasks: [Task]
    @Binding var selectedDay: String
    @State private var maincolor: Color = .blue
    @State private var SecondColor: Color = .green
    @State private var date = Date.now
    @State private var monthNames = Date.fullMonthNames
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
               /* 
                LabeledContent("Calendar Color") {
                  ColorPicker("", selection: $color, supportsOpacity: false)
                  }
                */
                HStack() {
                    Text(monthNames[date.monthInt-1]) // shows the month that we are at
                        .font(.system(size: 30))
                        .multilineTextAlignment(.leading)
                    
                    Text(date.formatted(.dateTime.year())) // shows the year that we are at
                        .font(.system(size: 25))
                        .multilineTextAlignment(.trailing)
                    
                    // DatePicker("", selection: $date, displayedComponents: .date)
                    
                    Spacer()
                    
                    Button( action: {
                        date = Date.now
                    }) {
                        Text("Today")
                            .bold()
                            .fontWeight(.black)
                            .background{
                                Rectangle()
                                    .foregroundStyle(maincolor.opacity(0.3))
                        }
                    }
                    .buttonStyle(DefaultButtonStyle())
                    
                }
                .padding()
                
                HStack{
                    ForEach(daysOfWeek.indices, id: \.self) { index in
                        Text(daysOfWeek[index])
                            .fontWeight(.black)
                            .foregroundStyle(maincolor)
                            .frame(maxWidth: .infinity)
                    } // this generates each first letter of the calendar
                }
                LazyVGrid(columns: columns) {
                    ForEach(days, id: \.self) { day in
                        if day.monthInt != date.monthInt {
                            Text("")
                        } else {
                            Button(action: {
                                // Handle the action when the day is tapped
                                
                                selectedDay = day.formatted(.dateTime.day().month().year()) //stores the date that you tapped on
                            }) {
                                // Text that becomes interactive
                                
                                Text(day.formatted(.dateTime.day())) //numbers of the callendar
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
                    
                }//end bracket of the LazyGrid layout
                .gesture(
                    DragGesture(minimumDistance: 50, coordinateSpace: .local)
                        .onEnded { value in
                            if (value.translation.width > 0 ){ //if user scrolls to the left
                                date = date.prevMonth          //it goes to prevv month
                                date = date.monthNamesProtection
                                
                            } else if (value.translation.width < 0 ) { //if user scrolls to the right
                                date = date.nextMonth                  //it goes to next month
                                date = date.monthNamesProtection
                                
                            }
                            
                        }
                )
                /*
                HStack {
                    Button(action: { //button to move to the prev month
                        date = date.prevMonth //moves to previous month
                        date = date.monthNamesProtection //checks that the actual
                                                        // month still inside the array

                    }) {
                        Image(systemName:"arrow.left")
                    }.font(.system(size: 15))

                    Spacer()

                    Button(action: { //button to move to the next moenth
                        date = date.nextMonth //moves to the next month
                        date = date.monthNamesProtection //checks that the actual
                                                        // month still inside the array

                    }) {
                        Image(systemName:"arrow.right")
                    }.font(.system(size: 15))
                }.padding([.top, .leading, .trailing], 15)
                */
                
                
                ScrollView(){
                    ForEach(tasks) { task in
                        if (task.dateStart.formatted(.dateTime.day().month().year()) == selectedDay) {
                            TaskBanner(task: task) //creates tasks item under the calendar
                        }
                    }
                    ForEach(oldTasks) { task in
                        if (task.dateStart.formatted(.dateTime.day().month().year()) ==
                            selectedDay) {
                            OldTasksBanner(task: task) //creates tasks item under the calendar
                        }
                    }
                }
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

#Preview {
    @State var task: [Task] = []
    @State var oldTasks: [Task] = []
    @State var selectedDay = String()
    return CalendarPageView(tasks: $task, oldTasks: $oldTasks, selectedDay: $selectedDay)
}
