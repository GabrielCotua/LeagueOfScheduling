//
//  TaskBanner.swift
//  ScheduleMaster
//
//  Created by 64026339 on 4/8/24.
//

import SwiftUI

struct TaskBanner: View {
    let task: Task?
    var body: some View {
        if(task != nil){
            VStack {
                Section{
                    VStack(alignment: .leading) {
                        HStack{
                            Text(task!.name)
                                .font(.title3)
                                .fontWeight(.semibold)
                            /*ForEach(1...task!.difficultyRating) { i in
                                Image(systemName: "stars.fill")
                            })*/
                            
                        }
                        Divider()
                        
                        HStack{
                            Text("\(task!.timeHours) Hours \(task!.timeMinutes) Minutes")
                            Spacer()
                            Text(DateFormatter.localizedString(from: task!.dateStart, dateStyle: .medium, timeStyle: .medium))
                        }
                        Divider()
                        HStack{
                            Text(task!.description)
                            Spacer()
                            Text("Rating: \(task!.difficultyRating, specifier: "%.0f")")
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
}

#Preview {
    TaskBanner(task: Task(name: "dsafiuhasf", description: "osjdfos", timeMinutes: 0, timeHours: 0, difficultyRating: 1.0, dateStart: Date(),dateEnd: Date()))
}
