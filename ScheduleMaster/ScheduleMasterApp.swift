//
//  ScheduleMasterApp.swift
//  ScheduleMaster
//
//  Created by 64026339 on 3/11/24.
//

import SwiftUI

@main
struct ScheduleMasterApp: App {
    @State public var tasksList = []
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
