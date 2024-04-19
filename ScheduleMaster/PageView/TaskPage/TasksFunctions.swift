//
//  TaskFunctions.swift
//  ScheduleMaster
//
//  Created by 64026339 on 4/15/24.
//

import Foundation
import SwiftUI

func organizeTasks(tasks: [Task]) -> [Task]{
    var newTasks: [Task] = tasks
    var temp: Task
    if(tasks.count == 1){
        return newTasks
    }
    for i in (0...(newTasks.count-2)){
        for j in ((i+1)...(newTasks.count - 1)){
            if(newTasks[i].dateStart.compare(newTasks[j].dateStart).rawValue > 0){
                temp = newTasks[i]
                newTasks[i] = newTasks[j]
                newTasks[j] = temp
            }
        }
    }
    return newTasks
}
func currentTasks(task: Task, tasks: Binding<[Task]>, oldTasks: Binding<[Task]>) -> Task?{
    if(task.dateEnd.compare(Date()).rawValue < 0){
        return nil
    }
    return task
}
extension Date {
    func adding(minutes: Int) -> Date {
        return Calendar.current.date(byAdding: .minute, value: minutes, to: self)!
    }
}
