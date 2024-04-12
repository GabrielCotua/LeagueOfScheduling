//
//  HomePageViewFunctions.swift
//  ScheduleMaster
//
//  Created by 64026339 on 4/12/24.
//

import Foundation

func findClosestTask(tasks: [Task]) -> Task? {
    if(tasks.isEmpty){
        return nil
    }
    var closestTask: Task? = nil
    
    for task in tasks{
        if(task.dateStart.compare(Date()).rawValue>0){
            closestTask = task
            break
        }
    }
    
    if(closestTask == nil){
        return nil
    }
    
    for task in tasks {
        if(task.dateStart.compare(Date()).rawValue>0 && task.dateStart.compare(closestTask!.dateStart).rawValue<0){
            closestTask = task
        }
    }
    
    return closestTask
}

func findCurrentTask(tasks: [Task]) -> Task? {
    
    var currentTask: Task? = nil
    
    for task in tasks{
        if(task.dateStart.compare(Date()).rawValue<0 && task.dateEnd.compare(Date()).rawValue>0){
            currentTask = task
            break
        }
    }
    return currentTask
}

