//
//  AddTaskView.swift
//  ScheduleMaster
//
//  Created by 64026339 on 3/25/24.
//

import SwiftUI


class GlobalTasks: ObservableObject {
    @Published var tasks: [Task] = []
}


class Task {
    var name: Binding<String>
    var description: String
    
    init(name: Binding<String>, description: String) {
        self.name = name
        self.description = description
    }
}


struct AddTaskView: View {
    let taskTypes = ["Work meeting","Homeworks", "Workout", "Hang out", "Custom"]
    @State private var taskType = "Work meeting"
    
    @State private var taskName = ""
    
    @State private var extraDescription = false
    
    @State private var textDescription = ""
    
    @State private var time: Double = 0
    
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
                
                Section("estimated time (minutes)"){
                    Slider(value: $time, in: 0...120)
                    Text("\(time, specifier: "%.0f" + " Minutes")")
                }
            }
            .navigationTitle("New Task")
        }
    }
}

#Preview {
    AddTaskView()
}
