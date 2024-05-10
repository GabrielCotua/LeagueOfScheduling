//
//  SwiftUIView.swift
//  ScheduleMaster
//
//  Created by 64023073 on 3/15/24.
//

import SwiftUI


struct TasksPageView: View {
    @Binding var tasks: [Task]
    @Binding var oldTasks: [Task]
    @Binding var showAlert: Bool
    
    var tempTask = Task(name: "dsafiuhasf", description: "osjdfos", timeMinutes: 0, timeHours: 0, difficultyRatingDouble: 1.0, dateStart: Date(),dateEnd: Date())
    
    @State private var currentTime = Date()

    var body: some View {
        NavigationStack{
            ScrollView {
                Section{
                    VStack {
                        ForEach(tasks) { task in
                            
                            TaskBanner(task: task)
                            
                        }
                        .onAppear {
                            startProcessingTasks(tasks: $tasks, oldTasks: $oldTasks, showAlert: $showAlert)
                        }
                    }
                }.frame(width: UIScreen.main.bounds.size.width)
            }.overlay(alignment: .bottomTrailing, content: {
                Section{
                    VStack(alignment: .trailing){
                        HStack{
                            NavigationLink(destination: AddTaskView(tasks: $tasks, oldTasks: $oldTasks)){
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
            })
        }
    }
}

#Preview {
    @State var tasks: [Task] = []
    @State var oldTasks: [Task] = []
    @State var showAlert = false
    return TasksPageView(tasks: $tasks, oldTasks: $oldTasks, showAlert: $showAlert)
}
