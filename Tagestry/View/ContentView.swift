//
//  ContentView.swift
//  Tagestry
//
//  Created by Jake Adams on 12/4/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        ImageGridView()
        addButton()
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
