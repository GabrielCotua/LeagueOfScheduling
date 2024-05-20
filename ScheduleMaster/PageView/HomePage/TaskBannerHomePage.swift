//
//  TaskBannerHomePage.swift
//  ScheduleMaster
//
//  Created by 64026339 on 4/11/24.
//

import SwiftUI

struct TaskBannerHomePage: View {
    var task: Task?
    var taskType: String
    
    var body: some View {
        if(task == nil){
            if(taskType == "Upcoming"){
                Text("You don't have any upcoming tasks")
            }
            else if (taskType == "Current"){
                Text("You don't have any current task")
            }
        }
        else{
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
                            if(task!.timeHours != 0){Text("\(task!.timeHours)h \(task!.timeMinutes)m")
                            }
                            else{
                                Text("\(task!.timeMinutes)m")
                            }
                            
                            Spacer()
                           
                            Text(task!.dateStart.formatted(date: .omitted, time: .shortened))
                        }
                        Divider()
                        HStack{
                            Text(task!.description)
                        }
                        
                    }
                }
            }
            .background(.tint)
        }
    }
}

#Preview {
    TaskBannerHomePage(task: Task(name: "Homeworks", description: "Finish pages 21 and 22 and bla bla yippity yap.", timeMinutes: 9, timeHours: 1, difficultyRatingDouble: 3.0, dateStart: Date(),dateEnd: Date()), taskType: "Current")
}
