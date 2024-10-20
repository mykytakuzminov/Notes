//
//  SwipeActionBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 17.10.24.
//

import SwiftUI

struct SwipeActionBootcamp: View {
    var body: some View {
        NavigationStack {
            List {
                Text("Go shopping")
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button("Delete") {}
                            .tint(.red)
                        
                        Button("Archive") {}
                            .tint(.yellow)
                        
                        Button("Share") {}
                            .tint(.blue)
                    }
            }
            .navigationTitle("To-do list")
        }
    }
}

#Preview {
    SwipeActionBootcamp()
}
