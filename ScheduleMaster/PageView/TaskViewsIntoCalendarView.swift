//
//  TaskViewsIntoCalendar.swift
//  ScheduleMaster
//
//  Created by 64023073 on 3/28/24.
//

import SwiftUI

struct TaskViewsIntoCalendarView: View {
    @Binding var tasks: [Task]
    @Binding var selectedDay: String
    var body: some View {
        ScrollView{
            ForEach(tasks) { task in
                if (task.dateStart.formatted(.dateTime.day()) == selectedDay) {
                VStack {
                    Section{
                        VStack(alignment: .leading) {
                            HStack{
                                    Text(task.name)
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                    Spacer()
                                    Text("\(task.timeHours) Hours \(task.timeMinutes) Minutes")
                                    
                                    Divider()
                                    HStack{
                                        Text(task.description)
                                        Spacer()
                                        Text("Rating: \(task.difficultyRating, specifier: "%.0f")")
                                    }
                                }
                            }
                        }
                        .padding()
                        .background(.tint)
                        .cornerRadius(20)
                        .padding()
                        
                    }
                }
            }
        }
    }
}

#Preview {
    @State var task: [Task] = []
    @State var selectedDay: String = ""
    return TaskViewsIntoCalendarView(tasks: $task, selectedDay: $selectedDay)
}
