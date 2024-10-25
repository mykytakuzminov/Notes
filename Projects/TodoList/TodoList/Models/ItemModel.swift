//
//  ItemModel.swift
//  TodoList
//
//  Created by Mykyta Kuzminov on 24.10.24.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    var isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func update() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
