//
//  ContentView.swift
//  ScheduleMaster
//
//  Created by Innov8ive on 3/11/24.
//

import SwiftUI

var totalPoints = 0


struct HomePageView: View {
    @Binding var tasks: [Task]
    @Binding var oldTasks: [Task]
    @Binding var showAlert: Bool
    
    var body: some View {
        NavigationStack{
            Section{
                ScrollView{
                    VStack{
                        HStack{
                            HStack
                            {
                                
                                Text("Total Points: \(totalPoints)")
                                Spacer()
                                
                            }
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.vertical)
                            
                            .cornerRadius(10)
                            .padding(.leading)
                            
                            NavigationLink(destination: ProfileOptions(tasks: $tasks, oldTasks: $oldTasks)){
                                Image(systemName: "person.circle.fill")
                            }
                            
                            .padding(.trailing)
                            .padding(.leading, 5)
                            .font(.system(size: 40))
                        }
                        
                        
                        
                        VStack(alignment: .leading){
                            Text("Current task: ")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Divider()
                            TaskBannerHomePage(task: findCurrentTask(tasks: tasks), taskType: "Current")
                            
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Your time for \(oldTasks[oldTasks.count-1].name) is finished"),
                                message: Text("Did you complete your task?"),
                                
                                primaryButton: .destructive(Text("No")),
                                
                                secondaryButton: .default(Text("Yes")){
                                    oldTasks[oldTasks.count-1].isCompleted = true
                                    let tempTask = oldTasks[oldTasks.count-1]
                                    totalPoints = totalPoints + Int(tempTask.difficultyRating) * (tempTask.timeMinutes + (tempTask.timeHours * 60))
                                }
                            )
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
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    
                }
                .navigationTitle("Home")
            }
        }
    }
}

#Preview {
    @State var tasks: [Task] = []
    @State var oldTasks: [Task] = []
    @State var showAlert = false
    return HomePageView(tasks: $tasks, oldTasks: $oldTasks, showAlert: $showAlert)
}
