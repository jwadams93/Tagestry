//
//  Tag.swift
//  Tagestry
//
//  Created by Jake Adams on 12/9/25.
//

import SwiftData
import Foundation

@Model
class Tag {
    var id: UUID
    var name: String
    
    @Relationship(inverse: \UserImage.tags)
    var images: [UserImage]
    
    init(name: String) {
        self.id = UUID()
        self.name = name
        self.images = []
    }
    
}
