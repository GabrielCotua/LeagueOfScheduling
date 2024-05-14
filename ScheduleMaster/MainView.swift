//
//  MainView.swift
//  ScheduleMaster
//
//  Created by 64026339 on 3/15/24.
//

import SwiftUI
import Foundation

struct MainView: View {
    @State var tasks: [Task] = []
    @State var oldTasks: [Task] = []
    @State var selectedDay: String = ""
    @State var showAlert = false
    @ObservedObject var mainViewModel = MainViewModel()
    
    init() {
            self._tasks = State(initialValue: UserDefaultsManager.loadTasks())
            self._oldTasks = State(initialValue: UserDefaultsManager.loadOldTasks())
        }
    
    var body: some View {
        TabView{
            HomePageView(tasks: $tasks, oldTasks: $oldTasks, showAlert: $showAlert)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            CalendarPageView(tasks: $tasks, oldTasks: $oldTasks, selectedDay: $selectedDay)
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
            TasksPageView(tasks: $tasks, oldTasks: $oldTasks, showAlert: $showAlert)
                .tabItem {
                    Label("Tasks", systemImage: "list.clipboard")
                }
        }
    }
        
        // Save tasks and oldTasks to UserDefaults when the view disappears
        func saveData() {
            UserDefaultsManager.saveTasks(tasks)
            UserDefaultsManager.saveOldTasks(oldTasks)
        }
    }

    // UserDefaultsManager for managing UserDefaults operations
    struct UserDefaultsManager {
        private static let tasksKey = "tasks"
        private static let oldTasksKey = "oldTasks"
        
        // Load tasks from UserDefaults
        static func loadTasks() -> [Task] {
            if let data = UserDefaults.standard.data(forKey: tasksKey),
               let tasks = try? JSONDecoder().decode([Task].self, from: data) {
                return tasks
            }
            return []
        }
        
        // Save tasks to UserDefaults
        static func saveTasks(_ tasks: [Task]) {
            if let data = try? JSONEncoder().encode(tasks) {
                UserDefaults.standard.set(data, forKey: tasksKey)
            }
        }
        
        // Load oldTasks from UserDefaults
        static func loadOldTasks() -> [Task] {
            if let data = UserDefaults.standard.data(forKey: oldTasksKey),
               let oldTasks = try? JSONDecoder().decode([Task].self, from: data) {
                return oldTasks
            }
            return []
        }
        
        // Save oldTasks to UserDefaults
        static func saveOldTasks(_ oldTasks: [Task]) {
            if let data = try? JSONEncoder().encode(oldTasks) {
                UserDefaults.standard.set(data, forKey: oldTasksKey)
            }
        }
    }
class MainViewModel: ObservableObject {
    @Published var tasks: [Task]
    @Published var oldTasks: [Task]
    @Published var selectedDay: String
    
    init() {
        self.tasks = UserDefaultsManager.loadTasks()
        self.oldTasks = UserDefaultsManager.loadOldTasks()
        self.selectedDay = ""
    }

    
    func saveData(tasks: [Task], oldTasks: [Task]) {
        UserDefaultsManager.saveTasks(tasks)
        UserDefaultsManager.saveOldTasks(oldTasks)
    }}

#Preview {
    MainView()
}
