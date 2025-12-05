//
//  TagestryApp.swift
//  Tagestry
//
//  Created by Jake Adams on 12/4/25.
//

import SwiftUI
import CoreData

@main
struct TagestryApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
