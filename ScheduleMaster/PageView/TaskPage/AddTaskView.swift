//
//  AddTaskView.swift
//  ScheduleMaster
//
//  Created by 64026339 on 3/25/24.
//

import SwiftUI

struct Task: Identifiable, Hashable, Codable{
    var id = UUID()
    var name: String
    var description: String
    var timeMinutes: Int
    var timeHours: Int
    var difficultyRating: Int
    var dateStart: Date
    var dateEnd: Date
    var isCompleted: Bool
    
    init(name: String, description: String, timeMinutes: Int, timeHours: Int, difficultyRatingDouble: Double, dateStart: Date, dateEnd: Date) {
        self.name = name
        self.description = description
        self.timeMinutes = timeMinutes
        self.timeHours = timeHours
        self.difficultyRating = Int(difficultyRatingDouble)
        self.dateStart = dateStart
        self.dateEnd = dateStart
        self.isCompleted = false
    }
    mutating func endUpDate(){
        self.dateEnd = self.dateStart.addingTimeInterval(60.0*Double(timeMinutes) + 3600.0*Double(timeHours))
    }
}


struct AddTaskView: View {
    @State private var task = Task(name: "", description: "", timeMinutes: 0, timeHours: 0, difficultyRatingDouble: 1.0, dateStart: Date(), dateEnd: Date())
    
    @State private var showingNameAlert = false
    
    @State private var showingPastDateAlert = false
    
    @State private var showingTaskDurationAlert = false
    
    @Binding var tasks: [Task]
    
    @Binding var oldTasks: [Task]
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var mainViewModel: MainViewModel 

    @State var difficultyRatingDouble = 1.0
    

    
    var body: some View {
        NavigationStack{
            List{
                Section("Name"){
                    
                    HStack{
                        
                        TextField("Name", text: $task.name)
                    }
                    
                }
                
                Section("Description"){
                    
                    TextField("Description", text: $task.description,  axis: .vertical)
                        .lineLimit(1...10)
                    
                }
                .pickerStyle(.navigationLink)
                
                Section("Date and Time"){
                    HStack{
                        Spacer()
                        DatePicker("Date: ", selection: $task.dateStart)
                            
                        Spacer()
                    }
                }
                
                Section("estimated time"){
                    
                    HStack{
                        Spacer()
                        Picker("", selection: $task.timeHours){
                            ForEach(0...8, id: \.self){ i in
                                Text("\(i)").tag(i)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                    
                        .frame(width: 50)
                        Text("Hours").fontWeight(.bold)
                        Spacer()
                        Picker("", selection: $task.timeMinutes){
                            ForEach(0...59, id: \.self){ i in
                                Text("\(i)").tag(i)
                            }
                            
                        }.pickerStyle(WheelPickerStyle())
                            .frame(width: 60)
                        Text("Min").fontWeight(.bold)
                        Spacer()
                    }.padding(.horizontal)
                        .frame(height: 90)
                    
                    Text("\(task.timeHours) Hours \(task.timeMinutes) Minutes")
                }
                 
               
                Section("Difficulty Rating"){
                    HStack{
                        Text("\(difficultyRatingDouble, specifier: "%.0f")")
                            .padding(.horizontal)
                        Slider(value: $difficultyRatingDouble, in: 1...5, step: 1){
                        }
                    
                    }
                }
                
                Button {
                    /*if(task.name == ""){
                     showingNameAlert = true
                     }
                     else if (task.dateStart.adding(minutes: 5).compare(Date()).rawValue < 0){
                     showingPastDateAlert = true
                     }
                     else if (task.timeHours == 0 && task.timeMinutes < 5){
                     showingTaskDurationAlert = true
                     }
                     else{*/
                    showingNameAlert = false
                    showingPastDateAlert = false
                    showingTaskDurationAlert = false
                    if(task.description == ""){
                        task.description = "(no description)"
                    }
<<<<<<< HEAD
                    task.endUpDate()
                    tasks.append(task)
                    organizeTasks(tasks: $tasks)
                    dismiss()
                    
                    let viewModel = MainViewModel()
                    viewModel.saveData(tasks: tasks, oldTasks: oldTasks)
=======
                    else if (task.dateStart.adding(minutes: 5).compare(Date()).rawValue < 0){
                        showingPastDateAlert = true
                    }
                    else if (task.timeHours == 0 && task.timeMinutes < 5){
                        showingTaskDurationAlert = true
                    }
                    else{*/
                        showingNameAlert = false
                        showingPastDateAlert = false
                        showingTaskDurationAlert = false
                        if(task.description == ""){
                            task.description = "(no description)"
                        }
                        task.endUpDate()
                        task.difficultyRating = Int(difficultyRatingDouble)
                        tasks.append(task)
                        organizeTasks(tasks: $tasks)
                        dismiss()
>>>>>>> d0b48833d4660e6f44b22f7ecb609ce159b1248d
                    //}
                } label: {
                    Text("Submit")
                }
                .alert("The task nasme is invalid.", isPresented: $showingNameAlert) {
                    Button("OK", role: .cancel) { }
                }
                .alert("The date you selected is in too old.", isPresented: $showingPastDateAlert) {
                    Button("OK", role: .cancel) { }
                }
                .alert("The task duration is too short.", isPresented: $showingTaskDurationAlert) {
                    Button("OK", role: .cancel) { }
                }
                
            }
        }
        .navigationTitle("New Task")
    }
}

#Preview {
    @State var tasks: [Task] = []
    @State var oldTasks: [Task] = []
    return AddTaskView(tasks: $tasks, oldTasks: $oldTasks)
}
