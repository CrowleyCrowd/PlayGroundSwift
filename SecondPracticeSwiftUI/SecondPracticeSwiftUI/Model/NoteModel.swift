//
//  NoteModel.swift
//  SecondPracticeSwiftUI
//
//  Created by Usuario invitado on 13/12/23.
//

import Foundation
struct NoteModel: Codable {
    let id: String
    var isFavorited: Bool
    let description: String
    
    init(id: String = UUID().uuidString, isFavorited: Bool = false, description: String) {
        self.id = id
        self.isFavorited = isFavorited
        self.description = description
    }
}
