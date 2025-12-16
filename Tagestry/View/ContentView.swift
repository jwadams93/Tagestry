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
    @Environment(\.modelContext) private var modelContext

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
                    await savePhotos(selectedPhotos)
                }
            }
    }
    
    func savePhotos(_ items: [PhotosPickerItem]) async {
        for item in items {
            do {
                let filename = try await saveImage(from: item)
                
                let asset = UserImage(filename: filename)
                modelContext.insert(asset)
                print("Holy fuck did it do ANYTHING??????")
            } catch {
                print("Failed to save: \(error)")
            }
        }
        // Try explicitly saving
            do {
                try modelContext.save()
                print("Context saved successfully")
            } catch {
                print("Failed to save context: \(error)")
            }
    }
    
    func saveImage(from item: PhotosPickerItem) async throws -> String {
        guard let data = try await item.loadTransferable(type: Data.self) else {
            throw NSError(domain: "ImageError", code: 0)
        }
        
        let filename = "\(UUID().uuidString).jpg"
        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(filename)
        
        try data.write(to: fileURL)
        
        return filename
    }
}

#Preview {
    ContentView(isPickerPresented: false)
}
