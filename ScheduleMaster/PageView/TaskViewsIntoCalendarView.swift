//
//  TaskViewsIntoCalendar.swift
//  ScheduleMaster
//
//  Created by 64023073 on 3/28/24.
//

import SwiftUI

struct TaskViewsIntoCalendarView: View {
    var body: some View {
        LazyVStack {
            ForEach(1...10, id: \.self) { count in
                //waiting for taks objects to be created
                Text("Task del Dia \(count)")
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

#Preview {
    TaskViewsIntoCalendarView()
}
