//
//  ImageGridView.swift
//  Tagestry
//
//  Created by Jake Adams on 12/4/25.
//

import SwiftUI
import SwiftData
import os

struct ImageGridView: View {
    
    let log = Logger()
    
    @State var detail: String? = nil
    @Environment(\.modelContext) private var modelContext

    @Query() var allPhotos: [UserImage]
    
    var body: some View {
        ZStack {
            photoGrid
            detailView
        }
        .animation(.default, value: detail)
    }

    @ViewBuilder
    var photoGrid: some View {
        ScrollView {
            LazyVGrid(columns: [
                .init(.adaptive(minimum: 100, maximum: .infinity), spacing: 3)
            ]) {
                ForEach(allPhotos) { photo in
                    ImageView(imageName: photo.filename)
                        .onAppear {
                            log.debug("Adding a photo to grid: \(photo.filename)")
                        }
                }
            }
        }.opacity(detail == nil ? 1 : 0)
    }

    @ViewBuilder
    var detailView: some View {
        if let d = detail {
            Image(d)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onTapGesture {
                    detail = nil
                }
        }
    }
}

#Preview {
    ImageGridView()
}
