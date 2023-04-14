//
//  MenuCommands.swift
//  MacAppUpdater
//
//  Created by 孙臻轩 on 2023/4/14.
//

import SwiftUI

struct MenuCommands: Commands {
    @Binding var toggleSetting: Bool

    var body: some Commands {
        CommandGroup(replacing: CommandGroupPlacement.appVisibility) {
            EmptyView()
        }
        CommandGroup(replacing: CommandGroupPlacement.newItem) {
            EmptyView()
        }
        CommandGroup(replacing: CommandGroupPlacement.pasteboard) {
            EmptyView()
        }
        CommandGroup(replacing: CommandGroupPlacement.toolbar) {
            EmptyView()
        }
        CommandGroup(replacing: CommandGroupPlacement.undoRedo) {
            EmptyView()
        }
        
        
        CommandMenu("Custom Menu") {
            Button(action: {
                print("Menu Button selected1")
                guard let window = NSApplication.shared.windows.first else {
                    return
                }

                // Make the window key and order it to the front
                window.makeKeyAndOrderFront(nil)
                
                guard let newWindowMenuItem = NSApplication.shared.mainMenu?.item(withTag: 1)?.submenu?.item(withTag: 2) else {
                    return
                }

                // Disable the menu item
                newWindowMenuItem.isEnabled = false
                
                
                if let fileMenu = NSApplication.shared.mainMenu?.item(withTag: 1)?.submenu {
                    for item in fileMenu.items {
                        print(item.tag)
                    }
                }
            }, label: {
                Text("Menu Button")
            })

            Divider()

            Toggle(isOn: $toggleSetting, label: {
                Text("Toggle")
            })
        }
    }
}
