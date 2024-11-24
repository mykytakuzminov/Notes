//
//  CoreDataBootcamp.swift
//  SwiftUIIntermediate
//
//  Created by Mykyta Kuzminov on 17.11.24.
//

import SwiftUI
import CoreData
import Combine

final class CoreDataService {
    
    static let shared = CoreDataService()

    @Published private(set) var items: [Item] = []
    
    private let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "ItemsContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Loading error occurred. \(error.localizedDescription)")
            } else {
                print("Loading occurred successfully.")
            }
        }
        
        fetchItems()
    }
    
    private func fetchItems() {
        let request = NSFetchRequest<Item>(entityName: "Item")
        
        do {
            items = try container.viewContext.fetch(request)
        } catch let error {
            print("Fetching error occurred. \(error.localizedDescription)")
        }
    }
    
    private func saveItems() {
        do {
            try container.viewContext.save()
            fetchItems()
        } catch let error {
            print("Saving error occurred. \(error.localizedDescription)")
        }
    }
    
    func addItem(with name: String) {
        let newItem = Item(context: container.viewContext)
        newItem.id = UUID().uuidString
        newItem.name = name
        
        saveItems()
    }
    
    func deleteItem(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        
        let item = items[index]
        container.viewContext.delete(item)
        
        saveItems()
    }
}

final class CoreDataViewModel: ObservableObject {
    
    @Published var items: [Item] = []
    
    private let coreDataService = CoreDataService.shared
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        bindToCoreDataService()
    }
    
    private func bindToCoreDataService() {
        coreDataService.$items
            .sink { [weak self] items in
                self?.items = items
            }
            .store(in: &cancellables)
    }
    
    func addItem(with name: String) {
        coreDataService.addItem(with: name)
    }
    
    func deleteItem(indexSet: IndexSet) {
        coreDataService.deleteItem(indexSet: indexSet)
    }
    
}

struct CoreDataBootcamp: View {
    
    @StateObject private var vm = CoreDataViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.items) { item in
                    Text(item.name ?? "")
                }
                .onDelete(perform: vm.deleteItem)
            }
            .navigationTitle("List of Items")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        vm.addItem(with: "New Item")
                    }
                }
            }
        }
    }
}

#Preview {
    CoreDataBootcamp()
}
