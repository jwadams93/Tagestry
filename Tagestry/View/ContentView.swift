//
//  ContentView.swift
//  Tagestry
//
//  Created by Jake Adams on 12/4/25.
//

import CoreData
import SwiftUI
import PhotosUI

struct ContentView: View {

    @State var isPickerPresented = false
    @State var selectedPhotos: PhotosPickerItem?

    var body: some View {
        ImageGridView()
        addButton(isPickerPresented: $isPickerPresented)
            .photosPicker(isPresented: $isPickerPresented, selection: $selectedPhotos)
    }
}

#Preview {
    ContentView(isPickerPresented: false).environment(
        \.managedObjectContext,
        PersistenceController.preview.container.viewContext
    )
}
