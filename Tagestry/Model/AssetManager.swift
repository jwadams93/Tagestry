//
//  AssetManager.swift
//  Tagestry
//
//  Created by Jake Adams on 12/8/25.
//

import Foundation
import SwiftData
import PhotosUI
import SwiftUI

class AssetManager {
    @Environment(\.modelContext) private var modelContext
    
    func savePhotos(_ items: [PhotosPickerItem]) async {
        for item in items {
            do {
                let filename = try await saveImage(from: item)
                
                let asset = UserImage(filename: filename)
                modelContext.insert(asset)
            } catch {
                print("Failed to save: \(error)")
            }
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
