//
//  ProfileOptions.swift
//  ScheduleMaster
//
//  Created by 64002863 on 4/18/24.
//

import SwiftUI

struct ProfileOptions: View {
    @Binding var tasks: [Task]
    @Binding var oldTasks: [Task]
    var body: some View {
        
        NavigationStack{
            List{
                Section(){
                    NavigationLink{
                        MyProfileView()
                    }
                label: {
                    Label("My Profile", systemImage: "person")
                }
                    NavigationLink {
                        OldTasksView(oldTasks: $oldTasks)
                    }
                label: {
                        Label("Old Tasks", systemImage: "checkmark.square")
                    }
                    NavigationLink {
                        SettingsPageView(tasks: $tasks, oldTasks: $oldTasks)
                    }
                label:{
                    Label("Settings", systemImage: "gearshape")
                }
                    
                }
                
                
                
                
            }.navigationTitle(Text("Profile"))
        }
        
    }
}

#Preview {
    @State var tasks: [Task] = []
    @State var oldTasks: [Task] = []
    @State var showAlert = false
    return HomePageView(tasks: $tasks, oldTasks: $oldTasks, showAlert: $showAlert)
    
}
