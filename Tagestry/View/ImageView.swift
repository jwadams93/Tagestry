//
//  ImageView.swift
//  Tagestry
//
//  Created by Jake Adams on 12/4/25.
//

import SwiftUI

struct ImageView: View {
    
    var body: some View {
        Image("imageTest")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .clipped()
            .aspectRatio(1, contentMode: .fit)
    }
}



#Preview {
    ImageView()
}
