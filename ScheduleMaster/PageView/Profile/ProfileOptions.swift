//
//  ProfileOptions.swift
//  ScheduleMaster
//
//  Created by 64002863 on 4/18/24.
//

import SwiftUI

struct ProfileOptions: View {
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
                        CompletedTasksView()
                    } 
                label: {
                        Label("Completed Tasks", systemImage: "checkmark.square")
                    }
                    NavigationLink {
                        SettingsPageView()
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
    return ProfileOptions()
    
}
