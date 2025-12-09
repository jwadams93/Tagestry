//
//  ContentView.swift
//  Tagestry
//
//  Created by Jake Adams on 12/4/25.
//

import SwiftData
import PhotosUI
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State var isPickerPresented = false
    @State var selectedPhotos: [PhotosPickerItem] = []

    var body: some View {
        ImageGridView()
        addButton(isPickerPresented: $isPickerPresented,)
            .photosPicker(
                isPresented: $isPickerPresented,
                selection: $selectedPhotos
            )
            .onChange(of: selectedPhotos) { oldValue, newValue in
                Task {
                    await AssetManager().savePhotos(newValue)
                }
            }
    }
}

#Preview {
    ContentView(isPickerPresented: false)
}
