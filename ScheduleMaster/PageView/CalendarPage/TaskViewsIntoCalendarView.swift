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
                    TaskBanner(task: task)
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
