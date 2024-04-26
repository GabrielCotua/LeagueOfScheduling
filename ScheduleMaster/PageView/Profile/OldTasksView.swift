//
//  CompletedTasksView.swift
//  ScheduleMaster
//
//  Created by 64002863 on 4/18/24.
//

import SwiftUI

struct OldTasksView: View {
    @Binding var oldTasks: [Task]
    var body: some View {
        NavigationStack{
            ScrollView{
                Section{
                    ForEach(oldTasks){ task in
                        OldTasksBanner(task: task)
                    }
                }
            }
            .navigationTitle("Old Tasks")
        }
        
    }
}


#Preview {
    @State var oldTasks: [Task] = []
    return OldTasksView(oldTasks: $oldTasks)
}
