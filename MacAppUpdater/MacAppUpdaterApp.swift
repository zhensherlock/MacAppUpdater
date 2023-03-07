//
//  MacAppUpdaterApp.swift
//  MacAppUpdater
//
//  Created by 孙臻轩 on 2023/3/4.
//

import SwiftUI

@main
struct MacAppUpdaterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup("MAC") {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
//        WindowGroup("MainWindow") {
//            ContentView()
//        }
    }
}
