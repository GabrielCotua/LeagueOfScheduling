//
//  TaskViewsIntoCalendar.swift
//  ScheduleMaster
//
//  Created by 64023073 on 3/28/24.
//

import SwiftUI

struct TaskViewsIntoCalendarView: View {
    @Binding var tasks: [Task]
    var body: some View {
        LazyVStack {
            ForEach(tasks) { tasks in
                VStack {
                    //waiting for taks objects to be created
                    Text(tasks.name)
                        .background(
                            Rectangle()
                                .frame(width:350)
                                .foregroundStyle(
                                    .opacity(0.3)
                                )
                        )
                }
            }
        }
    }
}

#Preview {
    @State var task: [Task] = []
    return TaskViewsIntoCalendarView(tasks: $task)
}
