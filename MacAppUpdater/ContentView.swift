//
//  ContentView.swift
//  MacAppUpdater
//
//  Created by 孙臻轩 on 2023/3/4.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @State private var isOn = false
    
    @State private var tintColor: Color = .accentColor

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    } label: {
                        Text(item.timestamp!, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "arrow.clockwise")
                    }
                }
            }
            Text("Select an item")
            
            Form {
                Toggle("使用指定的颜色", isOn: $isOn)
                
                Section {
                    HStack {
                        Text("Swift")
                        Spacer()
                        Image(systemName: "swift")
                            .foregroundColor(tintColor)
                    }
                } footer: {
                    Text("footer")
                    Button("这个是一个按钮") {}
                }
                
                Section {
                    Button("这是一个按钮") {}
                }
            }
            .formStyle(.grouped)
            .tint(.purple)
            .onChange(of: isOn) { newValue in
                tintColor = newValue ? .orange : .accentColor
            }
        }
//        .toolbarBackground(.linearGradient(
//                colors: [.blue, .purple],
//                startPoint: .leading,
//                endPoint: .trailing))
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//        let array = try FileManager.default.contentsOfDirectory(atPath: dirPath)
    }
}
