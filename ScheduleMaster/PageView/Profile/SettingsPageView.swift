//
//  SettingsPageView.swift
//  ScheduleMaster
//
//  Created by 64002863 on 4/18/24.
//

import SwiftUI

struct SettingsPageView: View {
    @Binding var tasks: [Task]
    @Binding var oldTasks: [Task]
    
    var body: some View {
       
        Button("Reset all tasks"){
            for task in tasks {
                tasks.remove(at: tasks.firstIndex(of: task)!)
            }
            for task in oldTasks {
                oldTasks.remove(at: oldTasks.firstIndex(of: task)!)
            }
            totalPoints = 0
        }
        
    }
}

#Preview {
    @State var tasks: [Task] = []
    @State var oldTasks: [Task] = []
    return SettingsPageView(tasks: $tasks, oldTasks: $oldTasks)
}
