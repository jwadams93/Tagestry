//
//  TagestryApp.swift
//  Tagestry
//
//  Created by Jake Adams on 12/4/25.
//

import SwiftUI
import SwiftData

@main
struct TagestryApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [UserImage.self, Tag.self])
    }
}
