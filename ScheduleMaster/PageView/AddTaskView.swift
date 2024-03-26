//
//  AddTaskView.swift
//  ScheduleMaster
//
//  Created by 64026339 on 3/25/24.
//

import SwiftUI


struct AddTaskView: View {
    
    let taskTypes = ["Work meeting","Homeworks", "Workout", "Hang out", "Custom"]
    @State private var taskType = "Work meeting"
    
    @State private var taskName = ""
    
    @State private var extraDescription = false
    
    @State private var textDescription = ""
    
    var body: some View {
        NavigationStack{
            List{
                Section("Type"){
                    Picker("What task type do you want to add?", selection: $taskType){
                        ForEach(taskTypes, id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.navigationLink)
                    if taskType == "Custom"{
                            HStack{
                                Text("Custom task name: ")
                                TextField("Type here", text: $taskName)
                            }
                    }
                    
                }
                Section("Description"){
                    Toggle("Do you want to add a description", isOn: $extraDescription.animation())
                    if extraDescription{
                            TextField("Type description here", text: $textDescription,  axis: .vertical)
                                .lineLimit(1...10)
                    }
                }.pickerStyle(.navigationLink)
            }
            .navigationTitle("New Task")
        }
    }
}

#Preview {
    AddTaskView()
}
