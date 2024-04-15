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
            ScrollView {
                Section{
                    VStack {
                        ForEach(tasks) { task in
                            TaskBanner(task: task)
                        }
                    }
                }.frame(width: UIScreen.main.bounds.size.width)
            }.overlay(alignment: .bottomTrailing, content: {
                Section{
                    VStack(alignment: .trailing){
                        HStack{
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
            })
        }
    }
}

#Preview {
    @State var tasks: [Task] = []
    return TasksPageView(tasks: $tasks)
}
