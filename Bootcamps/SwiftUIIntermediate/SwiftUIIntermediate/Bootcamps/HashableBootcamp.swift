//
//  HashableBootcamp.swift
//  SwiftUIIntermediate
//
//  Created by Mykyta Kuzminov on 17.11.24.
//

import SwiftUI

struct Task: Hashable {
    let title: String
    let description: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title + description)
    }
}

struct HashableBootcamp: View {
    
    let tasks: [Task] = [
        Task(title: "Title 1", description: "Description 1"),
        Task(title: "Title 2", description: "Description 2"),
        Task(title: "Title 3", description: "Description 3"),
    ]
    
    var body: some View {
        ScrollView {
            ForEach(tasks, id: \.self) { task in
                VStack(alignment: .leading) {
                    Text(task.title)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    
                    Text(task.description)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 10))
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    HashableBootcamp()
}
