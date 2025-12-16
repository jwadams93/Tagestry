//
//  ImageView.swift
//  Tagestry
//
//  Created by Jake Adams on 12/4/25.
//

import SwiftUI

struct ImageView: View {
    let imageName: String
    
    var body: some View {
        if let uiImage = loadImage(named: imageName) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .clipped()
                .aspectRatio(1, contentMode: .fit)
        } else {
            Color.gray // Placeholder if image doesn't load
        }
    }
    
    func loadImage(named filename: String) -> UIImage? {
        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(filename)
        
        guard let data = try? Data(contentsOf: fileURL) else { return nil }
        return UIImage(data: data)
    }
}

#Preview {
    ImageView(imageName: "testImage")
}
