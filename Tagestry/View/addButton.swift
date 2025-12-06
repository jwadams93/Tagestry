//
//  addButton.swift
//  Tagestry
//
//  Created by Jake Adams on 12/6/25.
//

import SwiftUI

struct addButton: View {
    var body: some View {
        Button("Add asset", systemImage: "plus", action: addAsset)
            .labelStyle(.iconOnly)
            .buttonStyle(.glass)
            .controlSize(.extraLarge)
            .buttonBorderShape(.capsule)
            .buttonSizing(.automatic)
    }
    
    func addAsset() {
        
    }
}

#Preview {
    addButton()
}
