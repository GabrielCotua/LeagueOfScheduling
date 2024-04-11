//
//  AddTaskView.swift
//  ScheduleMaster
//
//  Created by 64026339 on 3/25/24.
//

import SwiftUI


struct Task: Identifiable, Hashable{
    let id = UUID()
    var name: String
    var description: String
    var timeMinutes: Int
    var timeHours: Int
    var difficultyRating: Double
    var dateStart: Date
    var dateEnd: Date
    
    init(name: String, description: String, timeMinutes: Int, timeHours: Int, difficultyRating: Double, dateStart: Date, dateEnd: Date) {
        self.name = name
        self.description = description
        self.timeMinutes = timeMinutes
        self.timeHours = timeHours
        self.difficultyRating = difficultyRating
        self.dateStart = dateStart
        self.dateEnd = dateStart
    }
    mutating func endUpDate(){
        self.dateEnd = self.dateStart.addingTimeInterval(60.0*Double(timeMinutes) + 3600.0*Double(timeHours))
    }
}


struct AddTaskView: View {
    @State private var task = Task(name: "", description: "", timeMinutes: 0, timeHours: 0, difficultyRating: 1.0, dateStart: Date(), dateEnd: Date())
    
    @Binding var tasks: [Task]
    
    @Environment(\.dismiss) var dismiss
    
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
                        .frame(height: 70)
                    
                    Text("\(task.timeHours) Hours \(task.timeMinutes) Minutes")
                }
                
                Section("Difficulty Rating"){
                    HStack{
                        Text("\(task.difficultyRating, specifier: "%.0f")")
                            .padding(.horizontal)
                        Slider(value: $task.difficultyRating, in: 1...5, step: 1){
                        }
                    
                    }
                }
                
                Section("Date and Time"){
                    HStack{
                        Spacer()
                        DatePicker("Date: ", selection: $task.dateStart)
                            
                        Spacer()
                    }
                }
               
                
                Button {
                    task.endUpDate()
                    tasks.append(task)
                    dismiss()
                } label: {
                    Text("Submit")
                }
                
                
            }
        }
        .navigationTitle("New Task")
    }
}

#Preview {
    @State var tasks: [Task] = []
    return AddTaskView(tasks: $tasks)
}
