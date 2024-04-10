//
//  TaskBanner.swift
//  ScheduleMaster
//
//  Created by 64026339 on 4/8/24.
//

import SwiftUI

struct TaskBanner: View {
    let task: Task
    var body: some View {
        VStack {
            Section{
                VStack(alignment: .leading) {
                    HStack{
                        Text(task.name)
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("\(task.timeHours) Hours \(task.timeMinutes) Minutes")
                    }
                    Divider()
                    HStack{
                        Text(task.description)
                          Spacer()
                        Text("Rating: \(task.difficultyRating, specifier: "%.0f")")
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

#Preview {
    TaskBanner(task: Task(name: "dsafiuhasf", description: "osjdfos", timeMinutes: 0, timeHours: 0, difficultyRating: 1.0, dateStart: Date(),dateEnd: Date()))
}
