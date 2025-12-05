//
//  ImageGridView.swift
//  Tagestry
//
//  Created by Jake Adams on 12/4/25.
//

import SwiftUI

struct ImageGridView: View {

    @State var detail: String? = nil

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
                ForEach(1..<14) { i in
                    ImageView()
                        .onTapGesture {
                            detail = "imageTest"
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
