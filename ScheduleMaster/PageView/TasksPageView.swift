//
//  SwiftUIView.swift
//  ScheduleMaster
//
//  Created by 64023073 on 3/15/24.
//

import SwiftUI

class GlobalTasks: ObservableObject {
    @Published var tasks: [Task] = []
}

struct TasksPageView: View {
    @StateObject var globals = GlobalTasks()
    
    var body: some View {
        NavigationStack{
            VStack {
                ForEach(globals.tasks) { task in
                    VStack {
                        Text(task.name)
                        Text(task.description)
                        Text(String(task.timeHours))
                        Text(String(task.timeMinutes))
                    }
                }
            }
            
            Section{
                VStack(alignment: .trailing){
                    Spacer()
                    HStack{
                        Spacer()
                        NavigationLink(destination: AddTaskView()){
                            Image(systemName: "plus")
                                .font(.system(size: 30))
                                .padding()
                                .background(mainColor)
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
    TasksPageView()
}
