//
//  SettingsView.swift
//  MacAppUpdater
//
//  Created by 孙臻轩 on 2023/4/14.
//
import SwiftUI

struct SettingsView: View {
    @State private var selection = "Red"
    let colors = ["Red", "Green", "Blue", "Black", "Tartan"]

    var body: some View {
        Form {
            Picker("Select a paint color", selection: $selection) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(InlinePickerStyle())
        }
        .frame(width: 300)
        .navigationTitle("Demo Settings")
        .padding(80)
    }
}
