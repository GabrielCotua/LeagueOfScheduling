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
                            ForEach(1...task!.difficultyRating, id:\.self) { i in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15))
                            }
                            Spacer()
                            Text(task!.dateStart.formatted(.dateTime.day().month()))
                            
                        }
                        
                        HStack{
                            Text("\(task!.timeHours):\(task!.timeMinutes) hours")
                            Spacer()
                           
                            Text(task!.dateStart.formatted(date: .omitted, time: .shortened))
                        }
                        Divider()
                        HStack{
                            Text(task!.description)
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
    TaskBanner(task: Task(name: "Homeworks", description: "Finish pages 21 and 22 and bla bla yippity yap.", timeMinutes: 10, timeHours: 1, difficultyRatingDouble: 3.0, dateStart: Date(),dateEnd: Date()))
}
