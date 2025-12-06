//
//  userVideo.swift
//  Tagestry
//
//  Created by Jake Adams on 12/6/25.
//

import Foundation
import UniformTypeIdentifiers
import CoreTransferable

struct Video: Transferable, Encodable, Decodable {
    let url: URL
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .movie)
    }
    
    //TODO
    // this transferable representation should...
    //      - support import and export
    //      -
}
