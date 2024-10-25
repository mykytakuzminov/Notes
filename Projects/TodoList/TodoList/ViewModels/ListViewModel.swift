//
//  ListViewModel.swift
//  TodoList
//
//  Created by Mykyta Kuzminov on 24.10.24.
//

import Foundation

final class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet { saveItems() }
    }
    
    init() {
        getItems()
    }
    
    // MARK: - Item Managment Functions
    func delete(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func move(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func add(title: String) {
        items.append(ItemModel(title: title))
    }
    
    func update(item: ItemModel) {
        if let index = items.firstIndex(where: { item.id == $0.id }) {
            items[index] = item.update()
        }
    }
    
    // MARK: - Persistance Functions
    func saveItems() {
        if let data = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(data, forKey: "items")
        }
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: "items"),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        items = savedItems
    }
}
