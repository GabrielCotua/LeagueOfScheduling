//
//  SwiftUIView.swift
//  ScheduleMaster
//
//  Created by 64023073 on 3/15/24.
//

import SwiftUI

struct TasksPageView: View {
    @Binding var tasks: [Task]
    
    var body: some View {
        NavigationStack{
            VStack {
                ForEach(tasks) { task in
                    VStack {
                        Section{
                            Text(task.name)
                            Text(task.description)
                            Text(String(task.timeHours))
                            Text(String(task.timeMinutes))
                        }
                    }
                }
            }
            
            Section{
                VStack(alignment: .trailing){
                    Spacer()
                    HStack{
                        Spacer()
                        NavigationLink(destination: AddTaskView(tasks: $tasks)){
                            Image(systemName: "plus")
                                .font(.system(size: 30))
                                .padding()
                                .background(.cyan)
                                .cornerRadius(20)
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Tasks")
        }
    }
}

#Preview {
    @State var tasks: [Task] = []
    return TasksPageView(tasks: $tasks)
}
