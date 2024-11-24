//
//  RelationshipsBootcamp.swift
//  SwiftUIIntermediate
//
//  Created by Mykyta Kuzminov on 18.11.24.
//

import SwiftUI
import CoreData
import Combine

final class RelationshipsDataService<T: NSManagedObject> {
    
    static func shared(containerName: String) -> RelationshipsDataService {
        return RelationshipsDataService<T>(containerName: containerName)
    }
    
    @Published var items: [T] = []
    
    private let container: NSPersistentContainer
    
    private init(containerName: String) {
        container = NSPersistentContainer(name: containerName)
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
        let request = NSFetchRequest<T>(entityName: String(describing: T.self))
        
        do {
            items = try container.viewContext.fetch(request)
        } catch let error {
            print("Fetching error occurred. \(error.localizedDescription)")
        }
    }
    
    private func saveItems() {
        
        
        do {
            try container.viewContext.save()
        } catch let error {
            print("Saving error occurred. \(error.localizedDescription)")
        }
    }
    
    func addItem(_ configuration: (T) -> ()) {
        let newItem = T(context: container.viewContext)
        configuration(newItem)
        saveItems()
    }
    
    func updateItem(_ item: T, configuration: (T) -> ()) {
        configuration(item)
        saveItems()
    }
    
    func deleteItem(_ item: T) {
        container.viewContext.delete(item)
        saveItems()
    }
    
    func deleteAllItems() {
        var items: [T] = []
        
        let request = NSFetchRequest<T>(entityName: String(describing: T.self))
        
        do {
            items = try container.viewContext.fetch(request)
        } catch let error {
            print("Fetching error occurred. \(error.localizedDescription)")
        }
        
        for item in items {
            container.viewContext.delete(item)
        }
        
        saveItems()
    }
}

final class RelationshipsViewModel: ObservableObject {
    
    @Published var teams: [Team] = []
    @Published var employees: [Employee] = []
    
    private let teamService = RelationshipsDataService<Team>.shared(containerName: "TeamsContainer")
    private let employeeService = RelationshipsDataService<Employee>.shared(containerName: "TeamsContainer")
    
    init() {
        bindToTeamService()
        bindToEmployeeService()
        makeRelationships()
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    private func bindToTeamService() {
        teamService.$items
            .sink { [weak self] teams in
                self?.teams = teams
            }
            .store(in: &cancellables)
    }
    
    private func bindToEmployeeService() {
        employeeService.$items
            .sink { [weak self] employees in
                self?.employees = employees
            }
            .store(in: &cancellables)
    }
    
    private func addTeams() {
        let teamNames = ["Tech Titans", "Code Crusaders", "Pixel Pioneers"]
        
        for i in 0..<3 {
            teamService.addItem { team in
                team.id = Int16(i)
                team.name = teamNames[i]
            }
        }
    }
    
    private func addEmployees() {
        let employeesNames = ["Emily", "James", "Sophia", "Ethan"]
        let employeesSurnames = ["Parker", "Anderson", "Bennet", "Carter"]
        
        for i in 0..<4 {
            employeeService.addItem { employee in
                employee.id = Int16(i)
                employee.name = employeesNames[i]
                employee.surname = employeesSurnames[i]
            }
        }
    }
    
    private func makeRelationships() {
        guard
            let team = teamService.items.first(where: { $0.id == 2 }),
            let employee = employeeService.items.first(where: { $0.id == 3 }),
            let context = team.managedObjectContext
        else { return }

        let employeeInContext = context.object(with: employee.objectID) as? Employee

        teamService.updateItem(team) { team in
            if let employeeInContext = employeeInContext {
                team.addToEmployees([employeeInContext])
            } else {
                print("Failed to retrieve employee in the same context")
            }
        }
    }
}

struct RelationshipsBootcamp: View {
    
    @StateObject private var vm = RelationshipsViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(vm.teams) { team in
                    TeamView(team: team)
                }
            }
            .navigationTitle("Teams")
        }
    }
}

#Preview {
    RelationshipsBootcamp()
}

struct TeamView: View {
    
    let team: Team
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(team.name ?? "")
                .font(.headline)
                .fontWeight(.semibold)
            
            VStack(alignment: .leading) {
                Text("Employees: ")
                
                if let employees = team.employees?.allObjects as? [Employee] {
                    ForEach(employees) { employee in
                        HStack(spacing: 0) {
                            Text(employee.name ?? "1")
                            Text(" ")
                            Text(employee.surname ?? "2")
                        }
                        .foregroundStyle(Color.secondary)
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.thinMaterial)
        .clipShape(.rect(cornerRadius: 10))
        .padding(.horizontal)
    }
}
