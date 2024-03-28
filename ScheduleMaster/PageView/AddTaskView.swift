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
    @State private var timeMinutes: Int = 0
    @State private var timeHours: Int = 0
    
    
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
                
                Section("estimated time"){
                    
                    HStack{
                        Spacer()
                        Picker("", selection: $timeHours){
                            ForEach(0...8, id: \.self){ i in
                                Text("\(i)").tag(i)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: 50)
                        Text("Hours").fontWeight(.bold)
                        Spacer()
                        Picker("", selection: $timeMinutes){
                            ForEach(0...59, id: \.self){ i in
                                Text("\(i)").tag(i)
                            }
                            
                        }.pickerStyle(WheelPickerStyle())
                            .frame(width: 60)
                            Text("Min").fontWeight(.bold)
                        Spacer()
                    }.padding(.horizontal)
                    
                    Text("\(timeHours) Hours \(timeMinutes) Minutes")
                }
                   /* HStack{
                        Text("Hours    ")
                            
                        Slider(value: $timeHours,
                               in: 0...8,
                               step: 1)
                    }
                    HStack{
                        Text("Minutes ")
                        Slider(value: $timeMinutes,
                               in: 0...60,
                               step: 5)
                    }
                    Text("\(timeHours, specifier: "%.0f" + " Hours ")\(timeMinutes, specifier: "%.0f" + " Minutes")")*/
                }
            }
            .navigationTitle("New Task")
        }
    }


#Preview {
    AddTaskView()
}
