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
    @Binding var oldTasks: [Task]
    var body: some View {
        NavigationStack{
            Section{
                VStack{
                    HStack{
                        Spacer()
                        NavigationLink(destination: ProfileOptions()){
                            Image(systemName: "person.circle.fill")
                        }
                  
                            .padding(.horizontal)
                            .font(.system(size: 40))
                    }
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
                        TaskBannerHomePage(task: findCurrentTask(tasks: tasks), taskType: "Current")
                        
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
    @State var oldTasks: [Task] = []
    return HomePageView(tasks: $tasks, oldTasks: $oldTasks)
}
