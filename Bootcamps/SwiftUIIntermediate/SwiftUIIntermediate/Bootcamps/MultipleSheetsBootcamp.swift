//
//  MultipleSheetsBootcamp.swift
//  SwiftUIIntermediate
//
//  Created by Mykyta Kuzminov on 14.11.24.
//

import SwiftUI

struct User: Identifiable {
    let id: Int
    let name: String
}

struct MultipleSheetsBootcamp: View {
    
    @State private var selectedUser: User?
    
    var body: some View {
        List {
            ForEach(1..<21) { index in
                Text("User #\(index)")
                    .onTapGesture {
                        selectedUser = User(id: index, name: "User #\(index)")
                    }
            }
        }
        .listStyle(.grouped)
        .sheet(item: $selectedUser) { user in
            Text(user.name)
        }
    }
}

#Preview {
    MultipleSheetsBootcamp()
}
