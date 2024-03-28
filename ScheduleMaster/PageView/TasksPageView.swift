//
//  SwiftUIView.swift
//  ScheduleMaster
//
//  Created by 64023073 on 3/15/24.
//

import SwiftUI

struct TasksPageView: View {
    var body: some View {
        NavigationStack{
            Section{
                VStack(alignment: .trailing){
                    Spacer()
                    HStack{
                        Spacer()
                        NavigationLink(destination: AddTaskView()){
                            Image(systemName: "plus")
                                .font(.system(size: 30))
                                .padding()
                                .background(mainColor)
                                .cornerRadius(20)
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Tasks")
        }
    }
}

#Preview {
    TasksPageView()
}
