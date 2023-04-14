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
    @State private var toggleSetting = true
    var body: some Scene {
        WindowGroup("Mac App Updater") {
//            SampleToolbars()
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .commands {
            MenuCommands(toggleSetting: $toggleSetting)
        }
        #if os(macOS)
        Settings {
            SettingsView()
        }
        #endif
    }
}
