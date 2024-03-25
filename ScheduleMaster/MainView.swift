//
//  MainView.swift
//  ScheduleMaster
//
//  Created by 64026339 on 3/15/24.
//

import SwiftUI

let mainColor = Color(red: 160/255.0, green: 200/255.0, blue: 250/255.0)

let grayColor = Color(red: 244/255.0, green: 244/255.0, blue: 244/255.0)

struct MainView: View {
    var body: some View {
        TabView{
            HomePageView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            CalendarPageView()
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
            TasksPageView()
                .tabItem {
                    Label("Tasks", systemImage: "list.clipboard")
                }
        }
    }
}

#Preview {
    MainView()
}
