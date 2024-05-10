//
//  TaskBannerHomePage.swift
//  ScheduleMaster
//
//  Created by 64026339 on 4/11/24.
//

import SwiftUI

func color(completed: Bool) -> Color{
    if(completed){
        return Color(.green)
    }
    return Color(.red)
}

struct OldTasksBanner: View {
    var task: Task?
    var body: some View {
        VStack {
            Section{
                VStack(alignment: .leading) {
                    HStack{
                        Text((task)!.name )
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("\((task)!.timeHours) Hours\((task)!.timeMinutes) Minutes")
                    }
                    Divider()
                    HStack{
                        Text((task)!.description)
                        Spacer()
                        Text("Rating: \((task)!.difficultyRating, specifier: "%.0f")")
                    }
                }
                .padding()
                .background(color(completed: task!.isCompleted))
                .cornerRadius(20)
                .padding()
            }
        }
    }
}

#Preview {
    OldTasksBanner(task: Task(name: "dsafiuhasf", description: "osjdfos", timeMinutes: 0, timeHours: 0, difficultyRatingDouble: 1.0, dateStart: Date(),dateEnd: Date()))
}
