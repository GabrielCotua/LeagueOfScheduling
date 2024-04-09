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
                    
                    
                    VStack{
                        Text("Current task: ")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Divider()
                    }
                    .padding()
                    .background(.tint)
                    .cornerRadius(20)
                    .padding()
                    
                    VStack(alignment: .leading)
                    {
                        Text("Upcoming tasks: ")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Divider()
                        Text("Homework")
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
    HomePageView()
}
