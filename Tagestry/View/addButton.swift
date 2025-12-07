//
//  addButton.swift
//  Tagestry
//
//  Created by Jake Adams on 12/6/25.
//

import SwiftUI
import PhotosUI

struct addButton: View {
    
    @Binding var isPickerPresented: Bool
    
    var body: some View {
        Button("Add asset", systemImage: "plus", action: addAsset)
            .labelStyle(.iconOnly)
            .buttonStyle(.glass)
            .controlSize(.extraLarge)
            .buttonBorderShape(.capsule)
            .buttonSizing(.automatic)
    }
    
    func addAsset() {
        isPickerPresented = true
    }
}

#Preview {
    addButton(isPickerPresented: .constant(false))
}
