//
//  ContentView.swift
//  ScheduleMaster
//
//  Created by Innov8ive on 3/11/24.
//

import SwiftUI

var totalPoints = 0
var dailyPoints = 0

struct HomePageView: View {
    
    @Binding var tasks: [Task]
    
    var body: some View {
        NavigationStack{
            Section{
                VStack{
                    HStack
                    {
                        Text("Total Points: \(totalPoints)")
                        Spacer()
                        Text("Daily Points: \(dailyPoints)")
                    }
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 5))
                    .cornerRadius(10)
                    .padding()
                    
                    
                    VStack(alignment: .leading){
                        Text("Current task: ")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Divider()
                        
                        if(tasks.isEmpty){
                            TaskBannerHomePage(task: nil, taskType: "Current")
                        }
                        
                        ForEach(tasks){ task in
                            TaskBannerHomePage(task: findCurrentTask(tasks: tasks), taskType: "Current")
                        }
                    }
                    .padding()
                    .background(.tint)
                    .cornerRadius(20)
                    .padding()
                    
                    VStack(alignment: .leading)
                    {
                        Text("Upcoming task: ")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Divider()
                        
                        TaskBannerHomePage(task: findClosestTask(tasks: tasks), taskType: "Upcoming")
                        
                    }
                    .padding()
                    .background(.tint)
                    .cornerRadius(20)
                    .padding()
                    
                    Spacer()
                }
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    @State var tasks: [Task] = []
    return HomePageView(tasks: $tasks)
}
