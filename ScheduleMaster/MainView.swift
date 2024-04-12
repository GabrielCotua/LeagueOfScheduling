//
//  MainView.swift
//  ScheduleMaster
//
//  Created by 64026339 on 3/15/24.
//

import SwiftUI

struct MainView: View {
    @State var tasks: [Task] = []
    @State var selectedDay: String = ""
    
    var body: some View {
        TabView{
            HomePageView(tasks: $tasks)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            CalendarPageView(tasks: $tasks, selectedDay: $selectedDay)
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
            TasksPageView(tasks: $tasks)
                .tabItem {
                    Label("Tasks", systemImage: "list.clipboard")
                }
        }
    }
}

#Preview {
    MainView()
}
