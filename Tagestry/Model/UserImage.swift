//
//  userImageModel.swift
//  Tagestry
//
//  Created by Jake Adams on 12/9/25.
//

import SwiftData
import Foundation

@Model
class UserImage {
    var id: UUID
    var filename: String
    var dateAdded: Date
    
    var tags: [Tag]
    
    init(filename: String, tags: [Tag] = []) {
        self.id = UUID()
        self.filename = filename
        self.dateAdded = Date()
        self.tags = tags
    }
}
