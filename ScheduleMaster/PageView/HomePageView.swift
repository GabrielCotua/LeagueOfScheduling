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
                    VStack(alignment: .leading)
                    {
                        Text("Total Points: \(totalPoints)")
                        Divider()
                        Text("Dayly Points: \(dailyPoints)")
                    }
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding()
                    .background()
                    .cornerRadius(20)
                    .shadow(radius: 1)
                    .padding()
                    
                    
                    VStack(alignment: .leading) {
                        Text("Current task: ")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Divider()
                        Text("uidsfuihdisfndfisufhnkgndlkgndfgnfdkgslnfkgnskfgnsklgnlfkdgnslfgkndlgnfklgndslkgndlsk")
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
                        Text("uhaefihfdiuopalfhmvuhfuoefhioaehoaiildkjfglsjg")
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
